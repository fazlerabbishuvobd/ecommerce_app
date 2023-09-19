import 'package:ecommerce_app/resources/assets/app_images/app_images.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/order_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
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
              const Text("Mobile Banking"),
              SizedBox(height: Get.height*0.01,),
              const Divider(),
              PaymentMethodListTile(
                icon: AppImage.bkash,
                paymentMethodName: 'Bkash',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Bkash");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.rocket,
                paymentMethodName: 'Rocket',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Rocket");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.nagad,
                paymentMethodName: 'Nagad',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Nagad");
                },
              ),
              const Divider(),
              SizedBox(height: Get.height*0.03,),

              const Text("Card"),
              SizedBox(height: Get.height*0.01,),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.card,
                paymentMethodName: 'Credit/Debit Card',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Credit/Debit Card");
                },
              ),
              const Divider(),
              SizedBox(height: Get.height*0.03,),

              const Text("Others Method"),
              SizedBox(height: Get.height*0.01,),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.stripe,
                paymentMethodName: 'Stripe',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Stripe");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.gPay,
                paymentMethodName: 'Google Pay',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Google Pay");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppImage.applePay,
                paymentMethodName: 'Apple Pay',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Apple Pay");
                },
              ),
              const Divider(),


              PaymentMethodListTile(
                paymentMethodName: 'Cash On Delivery',
                icon: AppImage.cashOn,
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Cash On Delivery");
                  Get.offAll(()=> const OrderConfirmationPage());
                },
              ),
              const Divider(),
              SizedBox(height: Get.height*0.1,),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        height: Get.height*0.08,
        width: Get.width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount: "),
            Text("2220.00 TK"),
          ],
        ),
      ),

    );
  }
}

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({
    super.key,
    this.icon,
    this.paymentMethodName,
    this.widget,
    this.onPressed,
  });

  final String? paymentMethodName,icon;
  final Widget? widget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
            child: Image.asset('$icon',height: Get.height*0.05,fit: BoxFit.fill,)
        ),
        title: Text("$paymentMethodName"),
        trailing: widget,
      ),
    );
  }
}
