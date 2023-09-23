import 'package:ecommerce_app/resources/assets/app_icon/app_icons.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:ecommerce_app/view/screens/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomListTile(
              icon: Icons.account_box_outlined,
              title: 'Account Information',
              onPressed: (){
                debugPrint("Account Information");
                Get.toNamed(AppRouteName.profileInfoPage);
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.location_on,
              title: 'Address Book',
              onPressed: (){
                debugPrint("Address Book");
                Get.toNamed(AppRouteName.addressPage);
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.dark_mode,
              title: 'Theme',
              onPressed: (){
                debugPrint("Theme");

                Get.bottomSheet(
                    backgroundColor: Colors.white,
                    isDismissible: true,
                    ThemeLanguageBottomSheet(
                      title: 'Choose Theme',

                      /// Option 1
                      icon1: AppIcon.lightMode,
                      option1Text: 'Light Mode',
                      onPressed1: () {
                        debugPrint('Light Mode');
                      },

                      /// Option 2
                      icon2: AppIcon.darkMode,
                      option2Text: 'Dark Mode',
                      onPressed2: () {
                        debugPrint('Dark Mode');
                      },
                    )
                );
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.translate_rounded,
              title: 'Languages',
              onPressed: (){
                debugPrint("Languages");

                Get.bottomSheet(
                  backgroundColor: Colors.white,
                  isDismissible: true,
                  ThemeLanguageBottomSheet(
                    title: 'Choose Language',

                    /// Option 1
                    icon1: AppIcon.bd,
                    option1Text: 'বাংলা',
                    onPressed1: () {
                      debugPrint('বাংলা');
                    },

                    /// Option 2
                    icon2: AppIcon.uk,
                    option2Text: 'English',
                    onPressed2: () {
                      debugPrint('English');
                    },
                  )
                );

              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.help_outline_outlined,
              title: 'Help',
              onPressed: (){
                debugPrint("Help");
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.policy_outlined,
              title: 'Policy',
              onPressed: (){
                debugPrint("Policy");
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.info,
              title: 'About Us',
              onPressed: (){
                debugPrint("About Us");
              },
            ),
            const Divider(),

            const Spacer(),
            Center(
              child: CustomMaterialButton(
                onPressed: (){
                  Get.toNamed(AppRouteName.signInPage);
                },
                color: Colors.amber,
                buttonText: 'Log Out',
                width: Get.width*0.8,
              ),
            ),

            AppStyle.height30,


          ],
        ),
      ),
    );
  }
}

class ThemeLanguageBottomSheet extends StatelessWidget {
  const ThemeLanguageBottomSheet({
    super.key,
    this.title,
    this.option1Text,
    this.option2Text,
    this.icon1,
    this.icon2,
    this.onPressed1,
    this.onPressed2,
  });

  final String? title,option1Text,option2Text,icon1,icon2;
  final VoidCallback? onPressed1, onPressed2;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.25,
        width: Get.width,
      widget: Column(
        children: [
          Text("$title",style: AppStyle.playFont16Bold,),
          AppStyle.height30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                padding: const EdgeInsets.all(AppStyle.padding10),
                onPressed:onPressed1,
                height: Get.height*0.14,
                  width: Get.width*0.25,
                color: Colors.green.withOpacity(0.2),
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('$icon1',height: 60,),
                    AppStyle.height10,
                    Text("$option1Text",style: AppStyle.playFontBold,),
                  ],
                ),
              ),

              CustomContainer(
                padding: const EdgeInsets.all(AppStyle.padding5),
                onPressed: onPressed2,
                height: Get.height*0.14,
                width: Get.width*0.25,
                color: Colors.blue.withOpacity(0.2),
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('$icon2',height: 60,),
                    AppStyle.height10,
                    Text("$option2Text",style: AppStyle.playFontBold,),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
  });

  final IconData? icon;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title,style: AppStyle.playFont16,),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
