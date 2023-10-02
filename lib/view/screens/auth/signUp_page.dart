import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/viewmodel/auth/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const Icon(Icons.shopping_bag_outlined,size: 60,),
                  Text("Hi, Welcome",style: AppStyle.playFontBold.copyWith(fontSize: 20),),
                  Text("Let's make your journey",style: AppStyle.playFont,),
                  AppStyle.height20,

                  CustomTextField(
                    controller: getController.nameController,
                    //validator: (value) => validateName(value),
                    icon: Icons.person_2_outlined,
                    hintText: 'Your name',
                    isObscure: false,
                  ),
                  AppStyle.height10,

                  CustomTextField(
                    controller: getController.emailController,
                    validator: (value) => validateEmail(value),
                    icon: Icons.email_outlined,
                    hintText: 'Your email',
                    isObscure: false,
                  ),
                  AppStyle.height10,

                  CustomTextField(
                    controller: getController.phoneNumber,
                    //validator: (value) => validatePhoneNo(value),
                    maxFieldDataLength: 11,
                    icon: Icons.phone_android_outlined,
                    hintText: 'Your phone number',
                    isObscure: false,
                  ),
                  AppStyle.height10,

                  Obx(() {
                    return CustomTextField(
                      controller: getController.passwordController,
                      //validator: (value) => validatePassword(value),
                      icon: Icons.lock_open,
                      hintText: 'Your password',
                      isObscure: getController.isObscurePass.value,
                      widget: Obx(() {
                        return IconButton(
                            onPressed: () {
                              getController.isObscurePass.value = !getController.isObscurePass.value;
                            },
                            icon: Icon(getController.isObscurePass.value?Icons.visibility_off:Icons.visibility)
                        );
                      }),
                    );
                  }),
                  AppStyle.height10,

                  Obx(() {
                    return CustomTextField(
                      controller: getController.reTypePasswordController,
                      //validator: (value) => validatePassword(value),
                      icon: Icons.lock_open,
                      hintText: 'Re-type password',
                      isObscure: getController.isObscureRePass.value,
                      widget: Obx(() {
                        return IconButton(
                            onPressed: () {
                              getController.isObscureRePass.value = !getController.isObscureRePass.value;
                            },
                            icon: Icon(getController.isObscureRePass.value?Icons.visibility_off:Icons.visibility)
                        );
                      }),
                    );
                  }),
                  AppStyle.height30,

                  CustomMaterialButton(
                    color: Colors.amber,
                    width: Get.width*0.6,
                    buttonText: 'Sign Up',
                    onPressed: (){
                      if(_formKey.currentState!.validate())
                        {
                          if(getController.passwordController.text == getController.reTypePasswordController.text)
                            {
                              getController.signUpWithEmail();
                            }
                          else{
                            debugPrint("Password not match");
                          }
                        }
                      else{
                        debugPrint("Not Validated");
                      }
                    },
                  ),
                  SizedBox(height: Get.height*0.06,),



                  Text("---------   Or Sign Up With   --------",style: AppStyle.playFont,),
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
                    ],
                  ),

                  SizedBox(height: Get.height*0.02,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account?",style: AppStyle.playFont,),
                      TextButton(
                          onPressed: () => Get.toNamed(AppRouteName.signInPage),
                          child: Text("Sign In",style: AppStyle.playFont16Bold.copyWith(color: Colors.green),)
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');

    if (!nameRegExp.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
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
  
  String? validatePhoneNo(String value) {
    if(value.isEmpty)
      {
        return 'Cannot be empty';
      }
    else if(value.length != 11)
      {
        return "Phone no must be 11 digit";
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.icon,
    this.hintText,
    this.widget,
    required this.isObscure,
    this.validator,
    this.maxFieldDataLength,
  });

  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final Widget? widget;
  final bool isObscure;
  final FormFieldValidator? validator;
  final int? maxFieldDataLength;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blue.withOpacity(0.2),
      leading: Icon(icon),
      title: TextFormField(
        maxLength: maxFieldDataLength,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: '$hintText',
          hintStyle: AppStyle.playFont16,
          border: InputBorder.none,
        ),
        obscureText: isObscure,
      ),
      trailing: widget,
    );

  }
}
