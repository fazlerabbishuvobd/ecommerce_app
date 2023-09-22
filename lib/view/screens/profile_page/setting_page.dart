import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
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
              },
            ),
            const Divider(),

            CustomListTile(
              icon: Icons.translate_rounded,
              title: 'Languages',
              onPressed: (){
                debugPrint("Languages");
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
      ),
    );
  }
}
