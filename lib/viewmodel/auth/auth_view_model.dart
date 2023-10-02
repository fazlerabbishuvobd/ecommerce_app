import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/services/firebase/authentication/email_password_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends GetxController {
  EmailPasswordAuthentications emailAuthentication = EmailPasswordAuthentications();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();
  final phoneNumber = TextEditingController();

  Future<void> setUid(String uid) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('uid',uid);
  }


  ///************ Sign In Page ****************
  RxBool isObscure = true.obs;

  ///************ Sign Up Page ****************
  RxBool isObscurePass = true.obs;
  RxBool isObscureRePass = true.obs;

  Future<void> signUpWithEmail() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null && userCredential.user!.uid.isNotEmpty) {
        Get.offNamed(AppRouteName.signInPage);
      }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Warning Message',
        message: e.code.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }


  Future<void> signInWithEmail() async{
    try {
      final credential = await emailAuthentication.signInWithEmailPass(
          email: emailController.text, password: passwordController.text);
      if(credential.user != null)
        {
          Get.offAllNamed(AppRouteName.bottomNavBarPage);
          setUid(credential.user!.uid);
        }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Warning Message',
        message: e.code.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }


}
