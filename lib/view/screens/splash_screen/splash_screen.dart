import 'package:ecommerce_app/services/splash_screen/splash_screen_services.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
     SplashScreenServices.isLogin();
    });
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
            Text("E-Commerce App",
              style: AppStyle.playFontBold.copyWith(fontSize: 24),
            ),
            const Icon(Icons.shopping_cart,size: 60,color: Colors.amber,),
            const Spacer(),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
            AppStyle.height30,

            Text("Design & Developed by",style: AppStyle.playFont,),
            Text("Fazle Rabbi",
              style: AppStyle.playFontBold.copyWith(fontSize: AppStyle.font18),
            ),
            AppStyle.height40
          ],
        ),
      ),
    );
  }
}
