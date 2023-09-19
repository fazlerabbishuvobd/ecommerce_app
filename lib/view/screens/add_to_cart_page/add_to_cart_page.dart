import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  bool isCheckoutButtonLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: Get.height*0.8,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height*0.15,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',height: Get.height,fit: BoxFit.fill,),
                          ),
                          SizedBox(width: Get.width*0.02,),

                          SizedBox(
                            width: Get.width*0.49,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Name Product Name Product Name Product Name',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight:FontWeight.bold),
                                ),
                                Text('Product details',maxLines: 1,overflow: TextOverflow.ellipsis,),
                                Spacer(),
                                Text('\$ 5666.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    color: Colors.deepPurple
                                  ),
                                ),
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

                              SizedBox(width: Get.width*0.01,),
                              const Text('1',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: Get.width*0.01,),

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
            },
        ),
      ),
      bottomSheet: Container(
        height: Get.height*0.1,
        width: Get.width,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total"),
                Text("456250.00 TK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),

            SizedBox(
              height: Get.height*0.06,
              width: Get.width*0.4,
              child: MaterialButton(
                onPressed: ()async{
                  setState(() {
                    isCheckoutButtonLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  Get.to(()=> const CheckoutPage());
                  setState(() {
                    isCheckoutButtonLoading = false;
                  });
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isCheckoutButtonLoading? const Center(
                  child: CircularProgressIndicator(),
                ): Row(
                children: [
                  const Text("Checkout",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(width: Get.width*0.01,),
                  const Text("(120)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red)),
                ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
