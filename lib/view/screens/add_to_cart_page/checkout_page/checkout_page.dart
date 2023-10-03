import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/checkout_page/checkout_page_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/routes/app_routes_name.dart';
import '../../../../services/firebase/firestore/firestore_helper.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final getController = Get.put(CheckoutPageViewModel());
  final auth = FirebaseAuth.instance;
  FireStoreHelper fireStoreHelper = FireStoreHelper();
  double? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(AppStyle.padding10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
                margin: const EdgeInsets.only(bottom: AppStyle.padding10),
                height: Get.height*0.06,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                  color: Colors.amber.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline,color: Colors.red,),
                    AppStyle.width20,
                    Expanded(
                        child: Text("Before making an order, make sure the address is correct and match your current address",
                          style: AppStyle.playFont,
                          textAlign: TextAlign.justify
                        )
                    ),
                  ],
                ),
              ),
              AppStyle.height10,

              Text("Delivery Information", style: AppStyle.playFont16Bold,),

              GestureDetector(
                onTap: (){
                  debugPrint("Choose address");
                  Get.toNamed(AppRouteName.addressPage);
                },
                  child: const DeliveryInfoWidgets()
              ),
              AppStyle.height20,

              Text('Item Information',style: AppStyle.playFont16Bold),
              AppStyle.height10,

              StreamBuilder<QuerySnapshot>(
                stream: fireStoreHelper.getFilteredDocumentsStream(uid: auth.currentUser!.uid),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No data found'));
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final document = snapshot.data!.docs[index];
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
                            width: Get.width*0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(AppStyle.radius10),
                                        child: Image.network(document['imageUrl'],height: Get.height,width: Get.width*0.3,fit: BoxFit.fill)
                                    ),
                                    AppStyle.width20,

                                    SizedBox(
                                      width: Get.width*0.55,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(document['itemName'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle.playFontBold
                                          ),
                                          Text('${document['details']}',
                                            style: AppStyle.playFont,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                          const Spacer(),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('\$ ${document['price'] * document['quantity']}', style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                                              Text('${document['quantity']} pcs', style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Text('No Data Found');
                },
              ),
              AppStyle.height20,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery Type',style: AppStyle.playFont16Bold),
                  AppStyle.height10,

                  SizedBox(
                    width: Get.width,
                    height: Get.height*0.1,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: (){
                              debugPrint(index.toString());
                              getController.selectedDeliveryType.value = index;
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: AppStyle.padding10),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(AppStyle.padding5),
                              height: Get.height*0.08,
                              width: Get.width*0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppStyle.radius10),
                                border: Border.all(width: 1,color: Colors.black),
                                color: getController.selectedDeliveryType.value == index? Colors.amber:Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  index==0? Text("Standard Delivery - 90TK",style: AppStyle.playFontBold):
                                  index==1? Text("Fastest Delivery - 120 TK",style: AppStyle.playFontBold):
                                  Text("Express Delivery - 150 TK",style: AppStyle.playFontBold),

                                  index==0? Text("Day = 7",style: AppStyle.playFont):
                                  index==1? Text("Day = 2-3 ",style: AppStyle.playFont):
                                  Text("Tomorrow",style: AppStyle.playFont),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              AppStyle.height20,

              const PromotionsWidgets(),
              AppStyle.height20,


              OrderSummeryWidgets(
                itemTotal: 1230.00,
                deliveryDiscount: -10,
                deliveryFee: 120,
                discount: -50,
              ),
              SizedBox(height: Get.height*0.15,),
              
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
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
                Text("1230.02 TK",style: AppStyle.playFont16Bold),
              ],
            ),

            SizedBox(
              height: Get.height*0.06,
              width: Get.width*0.4,
              child: Obx(() {
                return MaterialButton(
                  onPressed: ()async{
                    getController.isOrderButtonLoading.value = true;
                    await Future.delayed(const Duration(seconds: 2));
                    Get.toNamed(AppRouteName.paymentPage);
                    getController.isOrderButtonLoading.value = false;
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                  ),
                  child: getController.isOrderButtonLoading.value? const Center(
                    child: CircularProgressIndicator(),):
                  Text("Pay Order",style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange),
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



class PromotionsWidgets extends StatelessWidget {
  const PromotionsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Promotions',style: AppStyle.playFont16Bold),
            const Divider(),

            SizedBox(
              height: Get.height*0.04,
              width: Get.width,
              child: ListTile(
                leading: const Icon(Icons.airplane_ticket),
                title: Text("Voucher",style: AppStyle.playFont16,),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            AppStyle.height20,

            SizedBox(
              height: Get.height*0.04,
              width: Get.width,
              child: ListTile(
                leading: const Icon(Icons.money),
                title: Text("Promo Code",style: AppStyle.playFont16,),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            AppStyle.height20,
          ],
        ),
      ),
    );
  }
}

class OrderSummeryWidgets extends StatelessWidget {
  const OrderSummeryWidgets({
    super.key,
    required this.itemTotal,
    this.deliveryFee,
    this.deliveryDiscount,
    this.discount,
  });

  final double itemTotal;
  final int? deliveryFee,deliveryDiscount,discount;

  @override
  Widget build(BuildContext context) {
    double totalPayment = itemTotal+deliveryFee!.toInt()+deliveryDiscount!.toInt()+discount!.toInt();
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.radius10),
      ),
      child: Container(
        height: Get.height*0.27,
        width: Get.width,
        padding: const EdgeInsets.all(AppStyle.padding10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Summery',style: AppStyle.playFont16Bold),
            const Divider(),
            AppStyle.height20,

            OrderSummeryInfo(
              name: 'Item Total',
              amount: '$itemTotal',
            ),
            OrderSummeryInfo(
              name: 'Delivery Fee',
              amount: '$deliveryFee',
            ),

            OrderSummeryInfo(
              name: 'Delivery Discount',
              amount: '$deliveryDiscount',
            ),
            OrderSummeryInfo(
              name: 'Discounts',
              amount: '$discount',
            ),
            OrderSummeryInfo(
              name: 'Total Payment',
              amount: totalPayment.toStringAsFixed(2),
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
      Text('$name',style: AppStyle.playFontBold,),
      Text('$amount TK',style: AppStyle.playFont,),
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
      padding: const EdgeInsets.all(AppStyle.padding10),
      height: Get.height*0.15,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyle.radius10),
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
        Icon(icon,size: Get.height*0.025,),
        AppStyle.width20,
        Expanded(
            child: Text('$text',
              style: AppStyle.playFont,
              maxLines: line,
              overflow: TextOverflow.ellipsis
            )
        ),
      ],
    );
  }
}
