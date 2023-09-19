import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/address_page/add_new_address_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/address_page/update_address_page.dart';
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
        title: const Text("Select Delivery Address"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [

              GestureDetector(
                onTap: (){
                  debugPrint("Add New Address");
                  Get.to(()=> const AddNewAddressPage());
                },
                child: Container(
                  height: Get.height*0.05,
                    width: Get.width*0.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange,
                    ),
                    child: const Text("Add New Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ),
              ),

              Container(
                width: Get.width,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Fazle Rabbi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    TextButton(
                                        onPressed: (){
                                          debugPrint("Edit Address");
                                          Get.to(()=> const UpdateAddressPage());
                                        },
                                        child: const Text("Edit")
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: Get.width*0.25,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.amber
                                  ),
                                    child: const Text("Label: Home")
                                ),
                                const Text("+8801767364544"),
                                const Text("Mohammadpur,Dhaka-1207 Mohammadpur,Dhaka-1207 Mohammadpur",),
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
