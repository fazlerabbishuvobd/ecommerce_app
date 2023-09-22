import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/view/screens/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppStyle.padding10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.shopping_bag_outlined,size: 150,),
                Text("Hello, Again",style: AppStyle.playFontBold.copyWith(fontSize: 24),),
                Text("Welcome back, you have seen missed",style: AppStyle.playFont,),
                AppStyle.height40,

                CustomTextField(
                  controller: emailController,
                  icon: Icons.email_outlined,
                  hintText: 'Your email',
                  isObscure: false,
                ),
                AppStyle.height20,
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.lock_open,
                  hintText: 'Your password',
                  isObscure: isObscure,
                  widget: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure?Icons.visibility_off:Icons.visibility)
                  ),
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
                    Get.offAllNamed(AppRouteName.bottomNavBarPage);
                  },
                ),
                SizedBox(height: Get.height*0.08,),

                Text("---------   or Sign In With   --------",style: AppStyle.playFont,),
                AppStyle.height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppIcon.google,height: Get.height*0.04,),
                    AppStyle.width30,
                    Image.asset(AppIcon.facebook,height: Get.height*0.04,),
                    AppStyle.width30,
                    Image.asset(AppIcon.microsoft,height: Get.height*0.04,),
                    AppStyle.width30,
                    Image.asset(AppIcon.google,height: Get.height*0.04,),
                  ],
                ),

                SizedBox(height: Get.height*0.06,),
                
                TextButton(
                  onPressed: () => Get.toNamed(AppRouteName.signUpPage),
                    child: Text("Don't have any account?  SignUP",style: AppStyle.playFontBold,)
                ),
                AppStyle.height40,
              ],
            ),
          ),
        ),
      ),
    );
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
  });

  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final Widget? widget;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: Colors.amber,
      height: Get.height*0.08,
      width: Get.width,
      widget: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffix: widget,
            hintText: '$hintText',
            hintStyle: AppStyle.playFont16,
            border: InputBorder.none,
            prefixIcon: Icon(icon),
        ),
        obscureText: isObscure,
      ),
    );
  }
}
