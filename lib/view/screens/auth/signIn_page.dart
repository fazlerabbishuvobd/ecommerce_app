import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/auth/signUp_page.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/viewmodel/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final getController = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppStyle.padding10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(Icons.shopping_bag_outlined,size: 120,),
                  Text("Hello, Again",style: AppStyle.playFontBold.copyWith(fontSize: 24),),
                  Text("Welcome back, you have seen missed",style: AppStyle.playFont,),
                  AppStyle.height40,

                  CustomTextField(
                    controller: emailController,
                    validator: (value) => validateEmail(value),
                    icon: Icons.email_outlined,
                    hintText: 'Your email',
                    isObscure: false,
                  ),
                  AppStyle.height20,


                  CustomTextField(
                    controller: passwordController,
                    validator: (value) => validatePassword(value),
                    icon: Icons.lock_open,
                    hintText: 'Your password',
                    isObscure: getController.isObscure.value,
                    widget: Obx(() {
                      return IconButton(
                          onPressed: () {
                            getController.isObscure.value = !getController.isObscure.value;
                          },
                          icon: Icon(getController.isObscure.value?Icons.visibility_off:Icons.visibility)
                      );
                    }),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          debugPrint("Forget Password");
                        },
                        child: const Text("Forget password?")
                    ),
                  ),
                  AppStyle.height10,

                  CustomMaterialButton(
                    color: Colors.amber,
                    width: Get.width*0.6,
                    buttonText: 'Sign In',
                    onPressed: (){
                      if(_formKey.currentState!.validate())
                        {
                          Get.offAllNamed(AppRouteName.bottomNavBarPage);
                        }
                      else{
                        debugPrint("Not Validated");
                      }
                    },
                  ),
                  SizedBox(height: Get.height*0.1,),

                  Text("---------   Or Sign In With   --------",style: AppStyle.playFont,),
                  AppStyle.height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          debugPrint("Google");
                        },
                          child: Image.asset(AppIcon.google,height: Get.height*0.04,)
                      ),
                      AppStyle.width30,
                      InkWell(
                        onTap: (){
                          debugPrint("Facebook");
                        },
                          child: Image.asset(AppIcon.facebook,height: Get.height*0.04,)
                      ),
                      AppStyle.width30,
                      InkWell(
                          onTap: (){
                            debugPrint("Microsoft");
                          },
                          child: Image.asset(AppIcon.microsoft,height: Get.height*0.04,)
                      ),
                      AppStyle.width30,
                      InkWell(
                          onTap: (){
                            debugPrint("Email");
                          },
                          child: Image.asset(AppIcon.google,height: Get.height*0.04,)
                      ),
                    ],
                  ),

                  SizedBox(height: Get.height*0.05,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have any account?",style: AppStyle.playFont,),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRouteName.signUpPage),
                          child: Text("Sign Up",style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange),)
                      ),
                    ],
                  ),
                  AppStyle.height40,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email address cannot be empty';
    }

    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // Return null if the input is valid
  }
}


