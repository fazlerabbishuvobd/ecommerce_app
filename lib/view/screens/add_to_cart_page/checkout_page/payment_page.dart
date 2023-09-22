import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/assets/app_icon/app_icons.dart';
import '../../../../resources/routes/app_routes_name.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Payment Method",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
            AppStyle.width20,
            const Icon(Icons.payments_outlined),
          ],
        ),
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
              Text("Mobile Banking",style: AppStyle.playFont,),
              AppStyle.height10,
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
              AppStyle.height30,

              Text("Card",style: AppStyle.playFont,),
              AppStyle.height10,
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
              AppStyle.height30,

              Text("Others Method",style: AppStyle.playFont),
              AppStyle.height10,
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
        padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.08,
        color: Colors.amber,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount: ",style: AppStyle.playFont16Bold,),
            Text("2220.00 TK",style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange),),
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
          borderRadius: BorderRadius.circular(AppStyle.radius10),
            child: Image.asset('$icon',height: Get.height*0.05,fit: BoxFit.fill,)
        ),
        title: Text("$paymentMethodName",style: AppStyle.playFont16Bold,),
        trailing: widget,
      ),
    );
  }
}
