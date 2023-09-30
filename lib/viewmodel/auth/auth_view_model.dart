import 'package:ecommerce_app/services/firebase/authentication/email_password_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/routes/app_routes_name.dart';

class AuthViewModel extends GetxController {
  EmailPasswordAuthentications emailAuthentication = EmailPasswordAuthentications();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();
  final phoneNumber = TextEditingController();

  ///************ Sign In Page ****************
  RxBool isObscure = true.obs;

  ///************ Sign Up Page ****************
  RxBool isObscurePass = true.obs;
  RxBool isObscureRePass = true.obs;

  Future<void> signUpWithEmail() async{
    try{
      final user = await emailAuthentication.signUpWithEmailPass(
          email: emailController.text,
          password: passwordController.text
      );
      Get.toNamed(AppRouteName.signInPage);
      customShowSnackbar(
        title: 'Confirmations Message',
        message: 'Registration Successfully Completed'
      );

    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        debugPrint("Weak password");
      } else if (e.code == 'email-already-in-use') {
        debugPrint("Already used");
      }
    }catch(e){
      debugPrint("Model View: ${e.toString()}");
    }
  }


  Future<void> signInWithEmail() async{
    try{
      final user = await emailAuthentication.signUpWithEmailPass(
          email: emailController.text,
          password: passwordController.text
      );

    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }catch(e){
      debugPrint("Model View: ${e.toString()}");
    }
  }


  SnackbarController customShowSnackbar({required String title,required String message}) {
    return Get.showSnackbar(
        GetSnackBar(
          title:title,
          message: message,
          duration: const Duration(seconds: 2),
        )
    );
  }

}
