import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/resources/app_constant/app_constant.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/routes/app_routes_name.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isButtonLoading = false;
  Future<void> refresh()async{
    await Future.delayed(const Duration(seconds: 2));
    debugPrint("Refresh");
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
          child: Column(
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
                      child: Text("See More", style: AppStyle.playFont16Bold),
                    ),
                  ],
                ),
              ),

              /// Category
              Container(
                padding: const EdgeInsets.all(AppStyle.padding5),
                width: Get.width,
                height: Get.height*0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                ),
                child: const CategoryListViewWidget(),
              ),
              AppStyle.height20,

              /// Product List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
                child: Text('Products', style: AppStyle.playFont16Bold),
              ),
              AppStyle.height10,
              ProductGridViewWidgets(
                itemCount: AppConstants.bannerImageList.length,
              ),
              AppStyle.height20,

              /// Load More Button
              Center(
                child: SizedBox(
                  width: Get.width*0.8,
                  child: MaterialButton(
                    onPressed: ()async{
                      setState(() {
                        isButtonLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        isButtonLoading = false;
                      });
                    },
                    height: 48,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppStyle.radius10)
                    ),
                    child: isButtonLoading?
                    const Center(child: CircularProgressIndicator(),
                    ):Text("Load More", style: AppStyle.playFont16Bold),
                  ),
                ),
              ),
              AppStyle.height20,

            ],
          ),
        ),


      ),
    );
  }
}

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AppConstants.bannerImageList.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            debugPrint("$index");
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: AppStyle.padding10),
            width: Get.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyle.radius10),
                border: Border.all(width: 1,color: Colors.black),
                color: Colors.white
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                  child: Image.network(AppConstants.bannerImageList[index],height: Get.height*0.08,fit: BoxFit.fill,),
                ),
                AppStyle.height10,
                Text('Electronics $index',
                  style: AppStyle.playFont16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductGridViewWidgets extends StatelessWidget {
  const ProductGridViewWidgets({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              debugPrint("$index");
              Get.toNamed(AppRouteName.productDetailsPage);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyle.radius10),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      child: Image.network(AppConstants.bannerImageList[index],height: Get.height*0.15,fit: BoxFit.fill,)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppStyle.padding5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apple watch ultra pro - max 256 GB 7 pro 9 240 GB Apple',
                          style: AppStyle.playFontBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        AppStyle.height10,
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star,color: Colors.deepOrange,),
                                Text('4.5/5(61)',style: AppStyle.playFont,),
                              ],
                            ),
                            AppStyle.width20,
                            const Text('Sold - 1.8K'),
                          ],
                        ),
                        AppStyle.height10,

                        Row(
                          children: [
                            Text('\$45.00',
                                style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)
                            ),
                            AppStyle.width20,
                            Text('\$50.00',
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
            ),
          );
        }
    );
  }
}

class BannerSliderWidgets extends StatefulWidget {
  const BannerSliderWidgets({
    Key? key,
    required this.isVisibleImageNumber,
    required this.isVisibleSliderDot,
    required this.itemCount,
    required this.imageList,
  }) : super(key: key);

  final bool isVisibleImageNumber,isVisibleSliderDot;
  final int itemCount;
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
                    Get.toNamed(AppRouteName.productFullImagePage);
                  },
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.imageList[index].toString()),
                        fit: BoxFit.fill
                      ),
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
