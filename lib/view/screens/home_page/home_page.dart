import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Slider and Search Bar
              SizedBox(
                height: Get.height*0.34,
                child: const Stack(
                  children: [
                    BannerSliderWidgets(),
                    SearchBarWidgets(),
                  ],
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
                height: Get.height*0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                child: const CategoryListViewWidget(),
              ),
              SizedBox(height: Get.height*0.02,),

              const Text('Products'),
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
                color: Colors.white),
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
  }) : super(key: key);

  @override
  State<BannerSliderWidgets> createState() => _BannerSliderWidgetsState();
}

class _BannerSliderWidgetsState extends State<BannerSliderWidgets> {
  List sliderInfo = ["Element 1", "Element 2","Element 3",'Element 4'];
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.blue.withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(
            height: Get.height*0.28,
            child: CarouselSlider.builder(
              itemCount: sliderInfo.length,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    const Text('Index'),
                    const Spacer(),
                    Text(sliderInfo[index].toString()),
                    Text('${index+1}'),
                  ],
                );
              },
              options: CarouselOptions(
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
          SizedBox(height: Get.height*0.02,),

          ///Slider Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderInfo.map((item){
              int index = sliderInfo.indexOf(item);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin:const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                height: 10.0,
                width: _currentImageIndex == index?30.0:10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentImageIndex == index? Colors.blue:Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: Get.height*0.02,),
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
    return Positioned(
      top: Get.height * 0.04,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        width: Get.width,
        height: 48,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: () {
                debugPrint("Search Page");
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
            ),

            GestureDetector(
              onTap: (){
                debugPrint("Add to Cart");
                Get.to(()=> const AddToCartPage());
              },
                child: const Icon(Icons.shopping_cart)
            ),
          ],
        ),
      ),
    );
  }
}
