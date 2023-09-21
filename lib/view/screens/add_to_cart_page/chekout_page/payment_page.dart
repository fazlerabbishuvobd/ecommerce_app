import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/app_route/app_routes_name.dart';
import '../../../../resources/assets/app_icon/app_icons.dart';

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
                icon: AppIcon.bkash,
                paymentMethodName: 'Bkash',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Bkash");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppIcon.rocket,
                paymentMethodName: 'Rocket',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Rocket");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppIcon.nagad,
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
                icon: AppIcon.card,
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
                icon: AppIcon.stripe,
                paymentMethodName: 'Stripe',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Stripe");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppIcon.gPay,
                paymentMethodName: 'Google Pay',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Google Pay");
                },
              ),
              const Divider(),

              PaymentMethodListTile(
                icon: AppIcon.applePay,
                paymentMethodName: 'Apple Pay',
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Apple Pay");
                },
              ),
              const Divider(),


              PaymentMethodListTile(
                paymentMethodName: 'Cash On Delivery',
                icon: AppIcon.cashOn,
                widget: const Icon(Icons.arrow_forward),
                onPressed: (){
                  debugPrint("Cash On Delivery");
                  Get.offAllNamed(AppRouteName.orderConfirmPage);
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
