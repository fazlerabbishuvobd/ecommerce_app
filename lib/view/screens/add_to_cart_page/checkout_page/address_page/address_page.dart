import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSetupPage extends StatefulWidget {
  const AddressSetupPage({super.key});

  @override
  State<AddressSetupPage> createState() => _AddressSetupPageState();
}

class _AddressSetupPageState extends State<AddressSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
            AppStyle.width10,
            Text("Select Delivery Address",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppStyle.padding10),
          child: Column(
            children: [

              GestureDetector(
                onTap: (){
                  debugPrint("Add New Address");
                  Get.toNamed(AppRouteName.addNewAddressPage);
                },
                child: Container(
                  height: Get.height*0.05,
                    width: Get.width*0.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppStyle.radius10),
                      color: Colors.deepOrange,
                    ),
                    child: Text("Add New Address",style: AppStyle.playFont16Bold,)
                ),
              ),

              Container(
                width: Get.width,
                padding: const EdgeInsets.all(AppStyle.padding10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: AppStyle.padding10),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(AppStyle.padding10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Fazle Rabbi",style: AppStyle.playFont16Bold,),
                                    TextButton(
                                        onPressed: (){
                                          debugPrint("Edit Address");
                                          Get.toNamed(AppRouteName.updateAddressPage);
                                        },
                                        child: Text("Edit",style: AppStyle.playFont)
                                    ),
                                  ],
                                ),

                                Container(
                                  margin: const EdgeInsets.only(bottom: AppStyle.padding10),
                                  width: Get.width*0.25,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(AppStyle.padding5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppStyle.radius5),
                                    color: Colors.amber
                                  ),
                                    child: Text("Label: Home",style: AppStyle.playFont)
                                ),
                                Text("+8801767364544",style: AppStyle.playFont),
                                Text("Mohammadpur, Dhaka-1207 Mohammadpur,Dhaka-1207 Mohammadpur",style: AppStyle.playFont,),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
