import 'package:ecommerce_app/resources/app_route/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavouriteProductPage extends StatefulWidget {
  const FavouriteProductPage({super.key});

  @override
  State<FavouriteProductPage> createState() => _FavouriteProductPageState();
}

class _FavouriteProductPageState extends State<FavouriteProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Favourite Product"),
            SizedBox(width: Get.width*0.02,),
            const Icon(Icons.favorite)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  debugPrint("Product Details");
                  Get.toNamed(AppRouteName.productDetailsPage);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      height: Get.height*0.15,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                height: Get.height,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.deepOrange,
                                  ),
                                  child: const Icon(Icons.ac_unit_outlined)
                              )
                          ),
                          SizedBox(width: Get.width*0.02,),
                          const Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Product Name",maxLines: 3,overflow: TextOverflow.ellipsis,),
                                  Text("Ratings: 4/5"),
                                  Text("Sold: 200"),
                                  Row(
                                    children: [
                                      Text("10230.00 Tk"),
                                      SizedBox(width: 10,),
                                      Text("123.00 Tk"),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: Get.width*0.02,
                      right: Get.width*0.02,
                        child: GestureDetector(
                          onTap: (){
                            debugPrint("Remove From Favourite $index");
                          },
                            child: const Icon(Icons.favorite_border)
                        )
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
