import 'package:ecommerce_app/view/screens/bottom_navbar/bottom_navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            const Text('Order Successfully Confirm'),
            SizedBox(height: Get.height*0.03,),

            Icon(Icons.check_circle,size: Get.height*0.1,color: Colors.green,),
            SizedBox(height: Get.height*0.03,),

            SizedBox(
              height: Get.height*0.06,
              width: Get.width*0.6,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.deepOrange,
                onPressed: ()async{
                  setState(() {
                    isButtonLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Get.offAll(()=> const BottomNavBarPage());
                  setState(() {
                    isButtonLoading = false;
                  });
                },
                child: isButtonLoading?const Center(child: CircularProgressIndicator()):const Text("Continue Shopping"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
