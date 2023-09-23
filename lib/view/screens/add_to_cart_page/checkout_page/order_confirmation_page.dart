import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/checkout_page/checkout_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/routes/app_routes_name.dart';


class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final getController = Get.put(CheckoutPageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Successfully Confirm',style: AppStyle.playFontBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
            AppStyle.height30,

            Icon(Icons.check_circle,size: Get.height*0.1,color: Colors.green,),
            AppStyle.height30,

            SizedBox(
              height: Get.height*0.06,
              width: Get.width*0.6,
              child: Obx(() {
                return MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                  ),
                  color: Colors.deepOrange,
                  onPressed: ()async{
                    getController.isContinueButtonLoading.value = true;
                    await Future.delayed(const Duration(seconds: 2));
                    Get.offAllNamed(AppRouteName.bottomNavBarPage);
                    getController.isContinueButtonLoading.value = false;
                  },
                  child: getController.isContinueButtonLoading.value?const Center(child: CircularProgressIndicator()):Text("Continue Shopping",style: AppStyle.playFont16Bold),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
