import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/routes/app_routes_name.dart';
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
            Text("Favourite Product",style: AppStyle.playFont16Bold.copyWith(fontSize: AppStyle.font18),),
            AppStyle.width20,
            const Icon(Icons.favorite)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
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
                      margin: const EdgeInsets.only(bottom: AppStyle.padding10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppStyle.radius10),
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
                                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                                    color: Colors.deepOrange,
                                  ),
                                  child: const Icon(Icons.ac_unit_outlined)
                              )
                          ),
                          AppStyle.width10,

                          Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Product Name",
                                    style: AppStyle.playFontBold,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  Text("Ratings: 4/5",style: AppStyle.playFont,),
                                  Text("Sold: 200",style: AppStyle.playFont,),

                                  Row(
                                    children: [
                                      Text("10230.00 Tk",style: AppStyle.playFontBold.copyWith(color: Colors.deepOrange),),
                                      AppStyle.width10,
                                      Text("123.00 Tk",style: AppStyle.playFont.copyWith(decoration: TextDecoration.lineThrough),),
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
