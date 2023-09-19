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

  int selectedAddressLabel = -1;
  bool saveButtonLoading = false;

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
        title: const Text("Add new delivery Address"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height*0.18,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Full Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                          const Text("Mobile Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
              SizedBox(height: Get.height*0.02,),

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height*0.25,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Area",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text("Input Area"),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                          const Text("Landmark (Optional)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
              SizedBox(height: Get.height*0.02,),

              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height*0.14,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Address Label (Optional)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(height: Get.height*0.02,),

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
                                  margin: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedAddressLabel == index?Colors.amber:Colors.amber.withOpacity(0.5),
                                  ),
                                  child: Text(index==0?'Home':index==1?'Office':'Others'),
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
                    debugPrint("Save");
                    setState(() {
                      saveButtonLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    Get.back();
                    setState(() {
                      saveButtonLoading = false;
                    });
                  },
                  child: saveButtonLoading? const Center(child: CircularProgressIndicator(),):const Text("Save"),
                ),
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
        border: InputBorder.none,
      ),
      keyboardType: inputType,
    );
  }
}
