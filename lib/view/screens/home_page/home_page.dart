import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/resources/app_constant/app_constant.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: (){
                    debugPrint("Add to Cart");
                    Get.to(()=> const AddToCartPage());
                  },
                  child: const Icon(Icons.shopping_cart)
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Slider and Search Bar
              SizedBox(
                height: Get.height*0.30,
                child: BannerSliderWidgets(
                  itemCount: AppConstants.bannerImageList.length,
                  imageList: AppConstants.bannerImageList,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Categories'),
                  TextButton(
                    onPressed: () {
                      debugPrint("See More");
                    },
                    child: const Text("See More"),
                  ),
                ],
              ),

              /// Category
              Container(
                padding: const EdgeInsets.all(5),
                width: Get.width,
                height: Get.height*0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CategoryListViewWidget(),
              ),
              SizedBox(height: Get.height*0.02,),

              const Text('Products'),
              SizedBox(height: Get.height*0.01,),
              const ProductGridViewWidgets(),
              SizedBox(height: Get.height*0.02,),

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
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: isButtonLoading?
                    const Center(child: CircularProgressIndicator(),
                    ):const Text("Load More"),
                  ),
                ),
              ),

              SizedBox(height: Get.height*0.02,),

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
      itemCount: 18,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            debugPrint("$index");
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            width: Get.width * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Colors.black),
                color: Colors.white
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Icon(
                    Icons.ac_unit_outlined,
                    size: Get.height * 0.08,
                  ),
                ),
                Text('$index'),
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
  });


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 21,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        if (index < 20) {
          return GestureDetector(
            onTap: (){
              debugPrint("$index");
              Get.to(()=> const ProductDetailsPage());
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  const Expanded(
                      child: Icon(Icons.ac_unit_outlined)
                  ),
                  Text('Product Name $index', maxLines: 2, overflow: TextOverflow.ellipsis,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Rating 4.5/5(61)'),
                      Text('Sold - 1.8K'),
                    ],
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('\$45.00'),
                      Text('\$50.00'),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
              child: Text('No Available')
          );
        }
      },
    );
  }
}

class BannerSliderWidgets extends StatefulWidget {
  const BannerSliderWidgets({
    Key? key,
    this.isVisibleImageNumber,
    this.itemCount,
    this.imageList,
  }) : super(key: key);

  final bool? isVisibleImageNumber;
  final int? itemCount;
  final List? imageList;

  @override
  State<BannerSliderWidgets> createState() => _BannerSliderWidgetsState();
}

class _BannerSliderWidgetsState extends State<BannerSliderWidgets> {
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
              itemCount: widget.itemCount,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.imageList![index].toString()),
                      fit: BoxFit.fill
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imageList!.map((item){
                    int index = widget.imageList!.indexOf(item);
                    return GestureDetector(
                      onTap: (){
                        debugPrint("$index");
                        setState(() {
                          _currentImageIndex =index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 450),
                        margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
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
                SizedBox(height: Get.height*0.02,),
                Visibility(
                  visible: widget.isVisibleImageNumber??false,
                  child: Column(
                    children: [
                      Text('${_currentImageIndex+1}/${widget.imageList!.length.toString()}'),
                      SizedBox(height: Get.height*0.02,),
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
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: Get.height*0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: Get.width * 0.8,
        child: Row(
          children: [
            const Icon(Icons.search),
            SizedBox(width: Get.width * 0.04,),
            const Text('Search Bar'),
          ],
        ),
      ),
    );
  }
}
