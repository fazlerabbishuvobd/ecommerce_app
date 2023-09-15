import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [

            /// Top Part ( Slider - Search Bar )
            const Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    BannerSliderWidgets(),
                    SearchBarWidgets(),
                  ],
                ),
            ),

            Expanded(
                flex: 10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Categories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Categories'),
                          TextButton(onPressed: (){
                            debugPrint("See More");
                          }, child: const Text("See More")),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: Get.width,
                        height: Get.height*0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: ListView.builder(
                            itemCount: 18,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  debugPrint("$index");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 10),
                                  height: Get.height*0.3,
                                  width: Get.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Icon(Icons.ac_unit_outlined,size: 90,),
                                      ),
                                      Text('$index'),
                                    ],
                                  ),
                                ),
                              );
                            },
                        ),
                      ),
                      const SizedBox(height: 20,),

                      Expanded(
                          child: GridView.builder(
                            itemCount: 20+1,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) {
                              if(index<20)
                                {
                                  return Container(
                                    padding: const EdgeInsets.all(5),
                                    height: Get.height*0.3,
                                    width: Get.width*0.03,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber,
                                    ),
                                    child: const Column(
                                      children: [
                                        Expanded(
                                            child: Icon(Icons.ac_unit_outlined)
                                        ),
                                        Text('Product Name',maxLines: 2,overflow: TextOverflow.ellipsis,),

                                        //Product Rating-Sold
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Rating 4.5/5(61)'),
                                            Text('Sold - 1.8K'),
                                          ],
                                        ),

                                        //Product Price
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('\$45.00'),
                                            Text('\$50.00'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              else{
                                return const Center(
                                    child: Text('No Available')
                                );
                              }
                              },
                          )
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSliderWidgets extends StatelessWidget {
  const BannerSliderWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.grey,
      child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Column(
              children: [
                const Text('Index'),
                const Spacer(),
                Text('$index'),
              ],
            );
          },
          options: CarouselOptions(
            autoPlay: true,
          )
      ),
    );
  }
}
class SearchBarWidgets extends StatelessWidget {
  const SearchBarWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height*0.04,
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
        width: Get.width,
        height: 48,
        color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home),

              GestureDetector(
                onTap: (){
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
                  width: Get.width*0.8,
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      SizedBox(width: Get.width*0.04,),
                      const Text('Search Bar'),
                    ],
                  ),
                ),
              ),

              const Icon(Icons.system_security_update_good),
            ],
          ),
        ),
    );
  }
}
