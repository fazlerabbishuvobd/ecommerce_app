import 'package:ecommerce_app/resources/app_constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({super.key});

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: AppConstants.bannerImageList.length,
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
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Get.height*0.2,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange,
                        border: Border.all(color: Colors.black,width: 2),
                        image: DecorationImage(
                            image: NetworkImage(AppConstants.bannerImageList[index]),
                          fit: BoxFit.fill,
                        )
                      ),
                    ),

                    /// Category Title
                    Positioned(
                      bottom: 10,
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height*0.06,
                          width: Get.width*0.95,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                            color: Colors.grey,
                          ),
                          child: Text("Clothes $index",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
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
