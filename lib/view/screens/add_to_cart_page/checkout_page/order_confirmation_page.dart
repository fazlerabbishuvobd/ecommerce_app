import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/routes/app_routes_name.dart';


class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  bool isButtonLoading = false;
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
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                ),
                color: Colors.deepOrange,
                onPressed: ()async{
                  setState(() {
                    isButtonLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Get.offAllNamed(AppRouteName.bottomNavBarPage);
                  setState(() {
                    isButtonLoading = false;
                  });
                },
                child: isButtonLoading?const Center(child: CircularProgressIndicator()):Text("Continue Shopping",style: AppStyle.playFont16Bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
