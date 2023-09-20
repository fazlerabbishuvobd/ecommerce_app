import 'package:ecommerce_app/view/screens/bottom_navbar/bottom_navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(()=> const BottomNavBarPage()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text("E-Commerce App",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
            const Icon(Icons.shopping_cart,size: 60,color: Colors.amber,),
            const Spacer(),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
            SizedBox(height: Get.height*0.03,),
            const Text("Design & Developed by"),
            const Text("Fazle Rabbi",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Get.height*0.04,),
          ],
        ),
      ),
    );
  }
}
