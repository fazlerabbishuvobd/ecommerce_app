import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenServices{
  static void isLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offNamed(AppRouteName.signInPage);
      } else {
        Get.offNamed(AppRouteName.bottomNavBarPage);
      }
    });
  }
}