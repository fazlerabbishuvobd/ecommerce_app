import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information',style: AppStyle.playFontBold.copyWith(fontSize: 18),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(AppRouteName.bottomNavBarPage);
              },
              icon: const Icon(Icons.home)
          )
        ],
        backgroundColor: Colors.amber,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppStyle.padding10),
        child: Column(
          children: [
            AppStyle.height20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(100, 48)),
                onPressed: (){
                  Get.toNamed(AppRouteName.profileInfoUpdatePage);
                  },
                child: Row(
                  children: [
                    Text("Edit",style: AppStyle.playFontBold,),
                  ],
            )
            ),

            AppStyle.height20,

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppStyle.padding5),
              height: Get.height*0.15,
              width: Get.height*0.15,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(85),
                  child: Image.network('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                    height: Get.height,
                    fit: BoxFit.fitHeight,
                  )
              ),
            ),
            AppStyle.height20,
            
            const ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.person),
              title: Text("Fazle Rabbi"),
            ),
            AppStyle.height10,

            const ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.phone_android_outlined),
              title: Text("+8801700 000000"),
            ),
            AppStyle.height10,

            const ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.email_outlined),
              title: Text("email@gmail.com"),
            ),
            AppStyle.height10,

            const ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.male),
              title: Text("Male"),
            ),
            AppStyle.height10,

            const ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.calendar_month),
              title: Text("12/12/2023"),
            ),
            AppStyle.height10,
          ],
        ),
      ),
    );
  }
}
