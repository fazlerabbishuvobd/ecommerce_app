import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/addTo_cart_page/addTo_cart_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/routes/app_routes_name.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final getController = Get.put(AddToCartPageViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Cart",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
            AppStyle.width20,
            const Icon(Icons.shopping_cart),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.8,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: 11,
            itemBuilder: (context, index) {
              if(index<10){
                return Card(
                  margin: EdgeInsets.only(
                      bottom: Get.height*0.02
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius5),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(AppStyle.padding10),
                    height: Get.height*0.16,
                    width: Get.width*0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppStyle.radius10),
                              child: Image.network('https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',height: Get.height,fit: BoxFit.fill,),
                            ),
                            AppStyle.width20,

                            SizedBox(
                              width: Get.width*0.46,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Product Name Product Name Product Name Product Name',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.playFontBold
                                  ),
                                  Text('Product details',
                                    style: AppStyle.playFont,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const Spacer(),

                                  Text('\$ 5666.00', style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      debugPrint("1");
                                    },
                                    child: const Icon(Icons.remove_circle,color: Colors.red,)
                                ),

                                AppStyle.width10,
                                Text('1',style: AppStyle.playFontBold),
                                AppStyle.width10,

                                GestureDetector(
                                    onTap: (){
                                      debugPrint("2");
                                    },
                                    child: const Icon(Icons.add_circle,color: Colors.green,)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              else{
                return Container(
                  height: Get.height*0.1,
                );
              }
            },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.1,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total",style: AppStyle.playFontBold,),
                Text("456250.00 TK",style: AppStyle.playFont16Bold,),
              ],
            ),

            SizedBox(
              width: Get.width*0.36,
              child: Obx(() {
                return MaterialButton(
                  height: Get.height*0.06,
                  onPressed: ()async{
                    getController.isCheckoutButtonLoading.value = true;
                    await Future.delayed(const Duration(seconds: 1));
                    Get.toNamed(AppRouteName.checkoutPage);
                    getController.isCheckoutButtonLoading.value = false;
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                  ),
                  child: getController.isCheckoutButtonLoading.value? const Center(
                    child: CircularProgressIndicator(),
                  ): Row(
                    children: [
                      Text("Checkout",style: AppStyle.playFont16Bold),
                      SizedBox(width: Get.width*0.01,),
                      Text("(120)",style: AppStyle.playFont16Bold.copyWith(color: Colors.red)),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
