import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/app_route/app_routes_name.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isOrderButtonLoading = false;
  int selectedDeliveryType = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Page"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                height: Get.height*0.06,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline,color: Colors.red,),
                    SizedBox(width: Get.width*0.02,),
                    const Expanded(
                        child: Text("Before making an order, make sure the address is correct and match your current address",
                          textAlign: TextAlign.justify
                        )
                    ),
                  ],
                ),
              ),

              const Text("Delivery Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                onTap: (){
                  debugPrint("Choose address");
                  Get.toNamed(AppRouteName.addressPage);
                },
                  child: const DeliveryInfoWidgets()
              ),
              SizedBox(height: Get.height*0.04,),

              const Text('Item Information',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              SizedBox(
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network('https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',height: Get.height*0.13,fit: BoxFit.fill,),
                              ),
                              SizedBox(width: Get.width*0.02,),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Product Name Product Name Product Name Product Name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text("Details",maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("12300 Tk",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                                        Text("Qty: 4",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                ),
              ),
              SizedBox(height: Get.height*0.04,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delivery Type',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: Get.height*0.01,),
                  SizedBox(
                    width: Get.width,
                    height: Get.height*0.1,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              debugPrint(index.toString());
                              setState(() {
                                selectedDeliveryType = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              height: Get.height*0.08,
                              width: Get.width*0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1,color: Colors.black),
                                color: selectedDeliveryType == index? Colors.amber:Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  index==0?const Text("Standard Delivery - 89TK"):index==1?
                                  const Text("Fastest Delivery - 90TK"):
                                  const Text("Express Delivery - 98TK"),

                                  index==0?const Text("Day = 7"):index==1?
                                  const Text("Day = 2-3 "):
                                  const Text("Tomorrow"),
                                ],
                              ),
                            ),
                          );
                        },
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height*0.02,),

              const PromotionsWidgets(),
              SizedBox(height: Get.height*0.02,),


              const OrderSummeryWidgets(),
              SizedBox(height: Get.height*0.15,),
              
            ],
          ),
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
                    isOrderButtonLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Get.toNamed(AppRouteName.paymentPage);
                  setState(() {
                    isOrderButtonLoading = false;
                  });
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isOrderButtonLoading? const Center(
                  child: CircularProgressIndicator(),
                ): const Text("Pay Order",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PromotionsWidgets extends StatelessWidget {
  const PromotionsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: Get.height*0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Promotions',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            const Divider(),
            SizedBox(
              height: 40,
              width: Get.width,
              child: const ListTile(
                leading: Icon(Icons.airplane_ticket),
                title: Text("Voucher"),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            SizedBox(height: Get.height*0.02,),

            SizedBox(
              height: 40,
              width: Get.width,
              child: const ListTile(
                leading: Icon(Icons.airplane_ticket),
                title: Text("Promo Code"),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            SizedBox(height: Get.height*0.04,),
          ],
        ),
      ),
    );
  }
}

class OrderSummeryWidgets extends StatelessWidget {
  const OrderSummeryWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: Get.height*0.25,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Order Summery',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            const Divider(),
            SizedBox(height: Get.height*0.02,),
            const OrderSummeryInfo(
              name: 'Item Total',
              amount: '1234560.00',
            ),
            const OrderSummeryInfo(
              name: 'Delivery Fee',
              amount: '123',
            ),
            const OrderSummeryInfo(
              name: 'Delivery Discount',
              amount: '00',
            ),
            const OrderSummeryInfo(
              name: 'Discounts',
              amount: '1230',
            ),
            const OrderSummeryInfo(
              name: 'Total Payment',
              amount: '1234560.00',
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummeryInfo extends StatelessWidget {
  const OrderSummeryInfo({
    super.key,
    this.name,
    this.amount
  });

  final String? name,amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text('$name'),
      Text('$amount TK'),
      ],
    );
  }
}

class DeliveryInfoWidgets extends StatelessWidget {
  const DeliveryInfoWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height*0.01),
      padding: const EdgeInsets.all(10),
      height: Get.height*0.22,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1,color: Colors.black)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width*0.80,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DeliveryInfoListTile(
                  icon: Icons.person,
                  text: 'Fazle Rabbi',
                ),
                DeliveryInfoListTile(
                  icon: Icons.phone_android_outlined,
                  text: '+8801767364544',
                ),
                DeliveryInfoListTile(
                  icon: Icons.email,
                  text: 'frs.cse@gmail.com',
                ),
                DeliveryInfoListTile(
                  icon: Icons.location_on,
                  text: 'Mohammadpur Dhaka 1207',
                  line: 3,
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}

class DeliveryInfoListTile extends StatelessWidget {
  const DeliveryInfoListTile({
    super.key,
    this.icon,
    this.text,
    this.line,
  });

  final IconData? icon;
  final String? text;
  final int? line;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 28,),
        SizedBox(width: Get.width*0.02,),
        Expanded(
            child: Text('$text',maxLines: line,overflow: TextOverflow.ellipsis,)
        ),
      ],
    );
  }
}
