import 'dart:io';
import 'dart:math';

import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/product_details_page/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppStyle.height20,

            Stack(
              children: [
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
                      borderRadius: BorderRadius.circular(100),
                      child: image == null?Image.network('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg', height: Get.height, fit: BoxFit.fitHeight,
                      ):Image.file(File(image!.path), height: Get.height,width: Get.width, fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 4,
                    child: GestureDetector(
                        onTap: (){
                          Get.bottomSheet(
                            BottomSheet(onClosing: () {},
                              builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: 150,
                                  width: Get.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Choose image from'),
                                      const SizedBox(height: 20),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              onPressed: ()async  {
                                                final pickedFile = await picker.pickImage(source: ImageSource.camera);
                                                if (pickedFile != null) {
                                                  setState(() {
                                                    image = pickedFile;
                                                  });
                                                }

                                                Get.back();

                                              },
                                              child: const Row(
                                                children: [
                                                  Text('Camera'),
                                                  Icon(Icons.camera_alt,color: Colors.deepPurple,)
                                                ],
                                              )
                                          ),
                                          ElevatedButton(
                                              onPressed: ()async{
                                                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                                if (pickedFile != null) {
                                                  setState(() {
                                                    image = pickedFile;
                                                  });
                                                }
                                                Get.back();
                                              },
                                              child: const Row(
                                                children: [
                                                  Text('Gallery'),
                                                  Icon(Icons.image,color: Colors.blue,)
                                                ],
                                              )
                                          ),
                                        ],
                                      )

                                    ],
                                  )
                              );
                            },
                            ),
                          );
                        },
                        child: const Icon(Icons.camera_alt_outlined)
                    )
                ),
              ],
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
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    onPressed: () {

                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  minWidth: 100,
                  color: Colors.red,
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                    onPressed: () {

                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  minWidth: 100,
                  color: Colors.green,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
