import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/address_page/address_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();

  final getController = Get.put(AddressPageViewModel());

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
            AppStyle.width10,
            Text("Add new delivery Address",style: AppStyle.playFontBold.copyWith(fontSize: 18)),
          ],
        ),
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
                          Text("Input Area",style: AppStyle.playFont16Bold),
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
                        child: Obx(() {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  getController.selectedAddressLabel.value = index;
                                },
                                child: Container(
                                  width: Get.width*0.28,
                                  margin: const EdgeInsets.only(right: AppStyle.padding10),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(AppStyle.padding5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                                    color: getController.selectedAddressLabel.value == index?Colors.amber:Colors.amber.withOpacity(0.5),
                                  ),
                                  child: Text(index==0?'Home':index==1?'Office':'Others',style: AppStyle.playFont16,),
                                ),
                              );
                            },
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.14,),

              Container(
                padding: const EdgeInsets.all(AppStyle.padding10),
                height: Get.height*0.09,
                width: Get.width,
                child: Obx(() {
                  return MaterialButton(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppStyle.radius10)
                    ),
                    onPressed: () async{
                      debugPrint("Save");
                      getController.saveButtonLoading.value = true;
                      await Future.delayed(const Duration(seconds: 2));
                      Get.back();
                      getController.saveButtonLoading.value = false;
                    },
                    child: getController.saveButtonLoading.value? const Center(child: CircularProgressIndicator(),): Text("Save",style: AppStyle.playFont16Bold),
                  );
                }),
              ),
            ],
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
    this.hintText,
    this.inputType,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '$hintText',
        hintStyle: AppStyle.playFont,
        border: InputBorder.none,
      ),
      keyboardType: inputType,
    );
  }
}
