import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/home_page/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/constant/app_constant.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({super.key});

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  final getController = Get.put(HomePageViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.category),
            AppStyle.width10,
            Text("All Categories",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        width: Get.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: getController.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  debugPrint("Category $index");
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Category Image
                    Container(
                      margin: const EdgeInsets.only(bottom: AppStyle.padding10),
                      height: Get.height*0.26,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppStyle.radius10),
                        border: Border.all(color: Colors.black,width: 2),
                        image: DecorationImage(
                          image: AssetImage(AppConstants.categoriesImageList[index]),
                        )
                      ),
                    ),

                    /// Category Title
                    Positioned(
                      bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.only(left: AppStyle.padding15),
                          alignment: Alignment.centerLeft,
                          height: Get.height*0.06,
                          width: Get.width*0.95,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppStyle.radius10),bottomRight: Radius.circular(AppStyle.radius10)),
                            color: Colors.transparent,
                          ),
                          child: Text(getController.categories[index].toString().toUpperCase(),style: AppStyle.playFontBold.copyWith(fontSize: 18),),
                        )
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
