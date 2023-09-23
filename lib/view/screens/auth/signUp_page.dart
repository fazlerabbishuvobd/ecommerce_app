import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/viewmodel/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();
  final phoneNumber = TextEditingController();

  final getController = Get.put(AuthViewModel());

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
                const Icon(Icons.shopping_bag_outlined,size: 60,),
                Text("Hi, Welcome",style: AppStyle.playFontBold.copyWith(fontSize: 20),),
                Text("Let's make your journey",style: AppStyle.playFont,),
                AppStyle.height20,

                CustomTextField(
                  controller: nameController,
                  icon: Icons.person_2_outlined,
                  hintText: 'Your name',
                  isObscure: false,
                ),
                AppStyle.height10,

                CustomTextField(
                  controller: emailController,
                  icon: Icons.email_outlined,
                  hintText: 'Your email',
                  isObscure: false,
                ),
                AppStyle.height10,

                CustomTextField(
                  controller: phoneNumber,
                  icon: Icons.phone_android_outlined,
                  hintText: 'Your phone number',
                  isObscure: false,
                ),
                AppStyle.height10,

                CustomTextField(
                  controller: passwordController,
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
                ),
                AppStyle.height10,

                CustomTextField(
                  controller: reTypePasswordController,
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
                ),
                AppStyle.height30,

                CustomMaterialButton(
                  color: Colors.amber,
                  width: Get.width*0.6,
                  buttonText: 'Sign Up',
                  onPressed: (){
                    Get.offAllNamed(AppRouteName.signInPage);
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
    return ListTile(
      tileColor: Colors.blue.withOpacity(0.2),
      leading: Icon(icon),
      title: TextFormField(
        controller: controller,
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
