import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/checkout_page/address_page/add_new_address_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAddressPage extends StatefulWidget {
  const UpdateAddressPage({super.key});

  @override
  State<UpdateAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<UpdateAddressPage> {
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();

  int selectedAddressLabel = -1;
  bool updateButtonLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneNoController.dispose();
    addressController.dispose();
    landmarkController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update delivery Address",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppStyle.padding10),
          child: Column(
            children: [

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(AppStyle.padding10),
                  height: Get.height*0.18,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Full Name",style: AppStyle.playFont16Bold),
                          SizedBox(
                            width: Get.width*0.4,
                            child: CustomTextField(
                              controller: nameController,
                              hintText: 'Name',
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile Number",style: AppStyle.playFont16Bold),
                          SizedBox(
                            width: Get.width*0.4,
                            child: CustomTextField(
                              controller: phoneNoController,
                              hintText: 'Mobile Number',
                              inputType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppStyle.height20,

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(AppStyle.padding10),
                  height: Get.height*0.25,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Area",style: AppStyle.playFont16Bold),
                          Text("Input Area",style: AppStyle.playFontBold),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Address",style: AppStyle.playFont16Bold),
                          SizedBox(
                            width: Get.width*0.65,
                            child: CustomTextField(
                              controller: addressController,
                              hintText: 'House no. / building / street / area',
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Landmark (Optional)",style: AppStyle.playFont16Bold),
                          SizedBox(
                            width: Get.width*0.4,
                            child: CustomTextField(
                              controller: landmarkController,
                              hintText: 'E.g beside rail station',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppStyle.height20,

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(AppStyle.padding10),
                  height: Get.height*0.14,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Address Label (Optional)",style: AppStyle.playFont16Bold),
                      AppStyle.height20,

                      SizedBox(
                        height: Get.height*0.05,
                        width: Get.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedAddressLabel = index;
                                });
                              },
                              child: Container(
                                width: Get.width*0.28,
                                margin: const EdgeInsets.only(right: AppStyle.padding10),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(AppStyle.padding5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                                  color: selectedAddressLabel == index?Colors.amber:Colors.amber.withOpacity(0.5),
                                ),
                                child: Text(index==0?'Home':index==1?'Office':'Others',style: AppStyle.playFont16,),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.14,),

              Container(
                padding: const EdgeInsets.all(10),
                height: Get.height*0.09,
                width: Get.width,
                child: MaterialButton(
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: () async{
                    debugPrint("Update");
                    setState(() {
                      updateButtonLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    Get.back();
                    setState(() {
                      updateButtonLoading = false;
                    });
                  },
                  child: updateButtonLoading? const Center(child: CircularProgressIndicator(),):Text("Update",style: AppStyle.playFont16Bold),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

