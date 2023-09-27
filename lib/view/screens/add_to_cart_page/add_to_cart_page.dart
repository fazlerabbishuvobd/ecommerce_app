import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/addTo_cart_page/addTo_cart_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/addTocartModel.dart';
import '../../../resources/assets/app_icon/app_icons.dart';
import '../../../resources/routes/app_routes_name.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final getController = Get.put(AddToCartPageViewModel());

  double totalPrice =0.0 ;
  List<AddToCartModel> addToCartItem = [
    AddToCartModel(title: 'Iphone X', quantity: 1, price: 120.0,details: 'Hi 1',productImage: AppIcon.bkash),
    AddToCartModel(title: 'Iphone 11', quantity: 1, price: 125.0,details: 'Hi 2',productImage: AppIcon.nagad),
    AddToCartModel(title: 'Iphone 12', quantity: 1, price: 128.0,details: 'Hi 3',productImage: AppIcon.google),
    AddToCartModel(title: 'Iphone 13', quantity: 1, price: 130.0,details: 'Hi 4',productImage: AppIcon.stripe),
    AddToCartModel(title: 'Iphone 14', quantity: 1, price: 140.0,details: 'Hi 5',productImage: AppIcon.bd),
    AddToCartModel(title: 'Iphone 15', quantity: 1, price: 150.0,details: 'Hi 6',productImage: AppIcon.rocket),
  ];


  @override
  Widget build(BuildContext context) {
    for (var item in addToCartItem) {
      totalPrice += item.price;
    }
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
        width: Get.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: addToCartItem.length+1,
            itemBuilder: (context, index) {
              if(index<addToCartItem.length){
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
                    width: Get.width*0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppStyle.radius10),
                              child: Image.asset('${addToCartItem[index].productImage}',height: Get.height,fit: BoxFit.fill)
                            ),
                            AppStyle.width20,

                            SizedBox(
                              width: Get.width*0.42,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(addToCartItem[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.playFontBold
                                  ),
                                  Text('${addToCartItem[index].details}',
                                    style: AppStyle.playFont,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const Spacer(),

                                  Text('\$ ${addToCartItem[index].price * addToCartItem[index].quantity}', style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: (){
                                      debugPrint("1");
                                      setState(() {
                                        totalPrice=0.0;
                                        if(addToCartItem[index].quantity>1)
                                          {
                                            addToCartItem[index].quantity--;
                                          }
                                        else{
                                          Get.snackbar('Can not be 0', 'Minimum 1',snackPosition:SnackPosition.BOTTOM);
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove_circle,color: Colors.red,)
                                ),

                                AppStyle.width10,
                                Text('${addToCartItem[index].quantity}',style: AppStyle.playFontBold),
                                AppStyle.width10,

                                InkWell(
                                    onTap: (){
                                      debugPrint("2");

                                      setState(() {
                                        if(addToCartItem[index].quantity<10)
                                        {
                                          addToCartItem[index].quantity++;
                                        }
                                        else{
                                          Get.snackbar('Max Limit', 'Max Limit 10',snackPosition:SnackPosition.BOTTOM);
                                        }
                                      });
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
        width: Get.width,
        color: Colors.amber,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total",style: AppStyle.playFontBold,),
                Text("${totalPrice.toStringAsFixed(2)}TK",style: AppStyle.playFont16Bold,),
              ],
            ),

            SizedBox(
              width: Get.width*0.38,
              child: Obx(() {
                return MaterialButton(
                  height: Get.height*0.06,
                  onPressed: ()async{
                    getController.isCheckoutButtonLoading.value = true;
                    await Future.delayed(const Duration(seconds: 1));
                    Get.toNamed(AppRouteName.checkoutPage,arguments: [addToCartItem,totalPrice]);
                    getController.isCheckoutButtonLoading.value = false;
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                  ),
                  child: getController.isCheckoutButtonLoading.value? const Center(
                    child: CircularProgressIndicator(),
                  ): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Checkout",style: AppStyle.playFont16Bold),
                      SizedBox(width: Get.width*0.01,),
                      Text("(${addToCartItem.length})",style: AppStyle.playFont16Bold.copyWith(color: Colors.red)),
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
