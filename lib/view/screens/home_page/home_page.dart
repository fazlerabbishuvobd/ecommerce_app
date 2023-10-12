import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/home_page/home_page_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/constant/app_constant.dart';
import '../../../resources/routes/app_routes_name.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<void> refresh()async{
    await Future.delayed(const Duration(seconds: 2));
    debugPrint("Refresh");
  }

  final getController = Get.put(HomePageViewModel());
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // getController.fetchCategories();
    // getController.fetchProducts();
    //getController.fetchData();
    print(user?.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
     onRefresh: refresh,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: Colors.amber,
          title: const SearchBarWidgets(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppStyle.padding10),
              child: GestureDetector(
                  onTap: (){
                    debugPrint("Notification Page");
                  },
                  child: const Icon(Icons.notifications)
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Obx(() {
            if(getController.isScreenLoading.value == true)
              {
                return Container(
                  alignment: Alignment.center,
                  height: Get.height*0.8,
                  width: Get.width,
                  child: const CircularProgressIndicator()
                );
              }
            else {
              if(getController.errorMessage.value.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Banner Slider
                      SizedBox(
                        height: Get.height*0.25,
                        child: BannerSliderWidgets(
                          isVisibleSliderDot: true,
                          isVisibleImageNumber: false,
                          itemCount: AppConstants.bannerImageList.length,
                          imageList: AppConstants.bannerImageList,
                        ),
                      ),

                      /// Category
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
                        height: Get.height*0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Categories', style: AppStyle.playFont16Bold),
                            GestureDetector(
                              onTap: () {
                                debugPrint("See More");
                                Get.toNamed(AppRouteName.allCategoryPage);
                              },
                              child: Text("View all", style: AppStyle.playFont16),
                            ),
                          ],
                        ),
                      ),

                      /// Category
                      Container(
                        padding: const EdgeInsets.all(AppStyle.padding5),
                        width: Get.width,
                        height: Get.height*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppStyle.radius10),
                        ),
                        child: CategoryListViewWidget(getController: getController),
                      ),
                      AppStyle.height20,

                      /// Product List
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
                        child: Text('Products', style: AppStyle.playFont16Bold),
                      ),
                      AppStyle.height10,

                      ProductGridViewWidgets(getController: getController),
                      AppStyle.height20,

                      /// Load More Button
                      Center(
                        child: SizedBox(
                          width: Get.width*0.8,
                          child: Obx(() {
                            return getController.hasMore.value?
                            MaterialButton(
                              onPressed: (){
                                getController.fetchMoreProducts().then((value) {
                                  setState(() {

                                  });
                                });
                              },
                              height: 48,
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppStyle.radius10)
                              ),
                              child: getController.isButtonLoading.value?
                              const Center(child: CircularProgressIndicator(),
                              ):Text("Load More", style: AppStyle.playFont16Bold),
                            ):const Text("No More Product Available");
                          }),
                        ),
                      ),
                      AppStyle.height20,

                    ],
                  );
                }
              else{
                return Text(getController.errorMessage.value);
              }
            }
          }),
        ),


      ),
    );
  }
}

class ProductGridViewWidgets extends StatelessWidget {
  const ProductGridViewWidgets({
    super.key,
    required this.getController,
  });

  final HomePageViewModel getController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getController.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          var productInfo = getController.productList[index];
          double regularPrice = (productInfo.price! * productInfo.discountPercentage!)/100;
          return GestureDetector(
              onTap: (){
                debugPrint("$index");
                getController.selectedProduct.value = index;
                Get.toNamed(AppRouteName.productDetailsPage,arguments: productInfo);
              },
              child: Obx(() {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                    color: getController.selectedProduct.value == index?Colors.blue.withOpacity(0.3):Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppStyle.padding10),topRight: Radius.circular(AppStyle.padding10)),
                          child: CachedNetworkImage(
                            imageUrl: "${productInfo.thumbnail}",height: Get.height*0.17,width: Get.width,fit: BoxFit.fill,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.amber,)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(AppStyle.padding5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Product Title
                            Text('${productInfo.title}',
                              style: AppStyle.playFontBold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppStyle.height10,

                            /// Rating - Stock
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star,color: Colors.deepOrange,),
                                    Text('${productInfo.rating}/5',style: AppStyle.playFont,),
                                  ],
                                ),
                                AppStyle.width20,
                                Text('Stock - ${productInfo.stock}',style: AppStyle.playFont,),
                              ],
                            ),
                            AppStyle.height10,

                            /// Product Price
                            Row(
                              children: [
                                Text('\$${productInfo.price}',
                                    style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)
                                ),
                                AppStyle.width20,
                                Text('\$${regularPrice.toStringAsFixed(2)}',
                                  style: AppStyle.playFont.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );

        }
    );
  }
}

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({
    super.key,
    required this.getController,
  });
  final HomePageViewModel getController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getController.categories.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var categoryList = getController.categories[index];
        return GestureDetector(
          onTap: () {
            debugPrint("$index");
            getController.selectedCategory.value = index;
          },
          child: Obx(() {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: AppStyle.padding10),
              padding: const EdgeInsets.all(AppStyle.padding5),
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                  border: Border.all(width: 1,color: Colors.black),
                  color: getController.selectedCategory.value == index?Colors.amber.withOpacity(0.2):Colors.white
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                    child: Image.asset(AppConstants.categoriesImageList[index],height: Get.height*0.07,fit: BoxFit.fill,),
                  ),
                  AppStyle.height10,
                  Text(categoryList,
                    style: AppStyle.playFont16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}


class BannerSliderWidgets extends StatefulWidget {
  const BannerSliderWidgets({
    Key? key,
    required this.isVisibleImageNumber,
    required this.isVisibleSliderDot,
    this.itemCount,
    required this.imageList,
  }) : super(key: key);

  final bool isVisibleImageNumber,isVisibleSliderDot;
  final int? itemCount;
  final List imageList;

  @override
  State<BannerSliderWidgets> createState() => _BannerSliderWidgetsState();
}

class _BannerSliderWidgetsState extends State<BannerSliderWidgets> {
  final carouselController = CarouselController();
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: widget.itemCount,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    debugPrint("${index+1}");
                    Get.toNamed(AppRouteName.productFullImagePage,arguments: widget.imageList);
                  },
                  child: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: CachedNetworkImage(
                      imageUrl: "${widget.imageList[index]}",fit: BoxFit.fill,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.amber,)),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                aspectRatio: 16/9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
              ),
            ),
          ),

          ///Slider Indicator
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Visibility(
                  visible: widget.isVisibleSliderDot,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageList.map((item){
                      int index = widget.imageList.indexOf(item);
                      return GestureDetector(
                        onTap: (){
                          debugPrint("$index");
                          carouselController.jumpToPage(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 450),
                          margin:const EdgeInsets.symmetric(horizontal: AppStyle.padding5,vertical: 2),
                          height: 10.0,
                          width: _currentImageIndex == index?30.0:15.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentImageIndex == index? Colors.amber:Colors.white60,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                AppStyle.height20,
                Visibility(
                  visible: widget.isVisibleImageNumber,
                  child: Column(
                    children: [
                      Text('${_currentImageIndex+1}/${widget.imageList.length.toString()}',style: AppStyle.playFontBold,),
                      AppStyle.height20,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidgets extends StatelessWidget {
  const SearchBarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Search Page");
        Get.toNamed(AppRouteName.productSearchPage);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
        height: Get.height*0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppStyle.radius10),
          color: Colors.white,
        ),
        width: Get.width * 0.8,
        child: Row(
          children: [
            const Icon(Icons.search),
            AppStyle.width40,
            Text('Search Bar', style: AppStyle.playFont.copyWith(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
