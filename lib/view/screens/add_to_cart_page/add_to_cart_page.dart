import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/viewmodel/addTo_cart_page/addTo_cart_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/routes/app_routes_name.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final getController = Get.put(AddToCartPageViewModel());
  // F3bHKgQjescMs1XKAsTJpSRbXxk1 8tu2sQJIzCR9SqiGoYrIY8DhtDr2
  //final _db = FirebaseFirestore.instance.collection('cart').where('uid', isEqualTo: '8tu2sQJIzCR9SqiGoYrIY8DhtDr2');

  double totalPrice =0.0 ;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getFilteredDocumentsStream() {
    Query query = firestore.collection('cart').where('uid', isEqualTo: '8tu2sQJIzCR9SqiGoYrIY8DhtDr2');
    return query.snapshots();
  }

  Future<void> incrementQuantity(documentId) async {
    try {
      // Reference to the Firestore document you want to update
      DocumentReference docRef = firestore.collection('cart').doc(documentId);

      // Fetch the current data from Firestore
      DocumentSnapshot documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        // Get the current quantity value
        int currentQuantity = documentSnapshot.get('quantity') ?? 0;

        // Update the quantity (increment by 1)
        int updatedQuantity = currentQuantity + 1;

        // Update the quantity field in Firestore
        await docRef.update({'quantity': updatedQuantity});
        print('Quantity updated successfully.');

      } else {
        print('Document does not exist.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  Future<void> decrementQuantity(documentId) async {
    try {
      // Reference to the Firestore document you want to update
      DocumentReference docRef = firestore.collection('cart').doc(documentId);

      // Fetch the current data from Firestore
      DocumentSnapshot documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        // Get the current quantity value
        int currentQuantity = documentSnapshot.get('quantity') ?? 0;

        // Update the quantity (decrement by 1)
        if(currentQuantity <= 1)
          {
            Get.showSnackbar(const GetSnackBar(
              title: 'Minimum Limit Reached',
              message: 'Quantity Cannot be empty',
              duration: Duration(seconds: 2),
            ));
          }
        else{
          int updatedQuantity = currentQuantity - 1;

          // Update the quantity field in Firestore
          await docRef.update({'quantity': updatedQuantity});
          print('Quantity updated successfully.');
        }

      } else {
        print('Document does not exist.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // for (var item in addToCartItem) {
    //   totalPrice += item.price;
    // }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Cart",style: AppStyle.playFontBold.copyWith(fontSize: 18),),
            AppStyle.width20,
            const Icon(Icons.shopping_cart),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: getFilteredDocumentsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data found'));
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final document = snapshot.data!.docs[index];
                    return Card(
                      margin: EdgeInsets.only(
                          bottom: Get.height*0.02
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppStyle.radius5),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(AppStyle.padding10),
                        height: Get.height*0.16,
                        width: Get.width*0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                                    child: Image.network(document['imageUrl'],height: Get.height,width: Get.width*0.3,fit: BoxFit.fill)
                                ),
                                AppStyle.width20,

                                SizedBox(
                                  width: Get.width*0.42,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(document['itemName'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.playFontBold
                                      ),
                                      Text('${document['details']}',
                                        style: AppStyle.playFont,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                      const Spacer(),

                                      Text('\$ ${document['price'] * document['quantity']}', style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          debugPrint("1");
                                          decrementQuantity(document.id);
                                        },
                                        child: const Icon(Icons.remove_circle,color: Colors.red,)
                                    ),

                                    AppStyle.width10,
                                    Text('${document['quantity']}',style: AppStyle.playFontBold),
                                    AppStyle.width10,

                                    InkWell(
                                        onTap: (){
                                          debugPrint("2");
                                          incrementQuantity(document.id);
                                        },
                                        child: const Icon(Icons.add_circle,color: Colors.green,)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const Text('No Data Found');
            },
          ),
        ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.all(AppStyle.padding10),
        height: Get.height*0.1,
        width: Get.width,
        color: Colors.amber,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total",style: AppStyle.playFontBold,),
                Text("${totalPrice.toStringAsFixed(2)}TK",style: AppStyle.playFont16Bold,),
              ],
            ),

            SizedBox(
              width: Get.width*0.38,
              child: Obx(() {
                return MaterialButton(
                  height: Get.height*0.06,
                  onPressed: ()async{
                    getController.isCheckoutButtonLoading.value = true;
                    await Future.delayed(const Duration(seconds: 1));
                    Get.toNamed(AppRouteName.checkoutPage);
                    getController.isCheckoutButtonLoading.value = false;
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppStyle.radius10),
                  ),
                  child: getController.isCheckoutButtonLoading.value? const Center(
                    child: CircularProgressIndicator(),
                  ): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Checkout",style: AppStyle.playFont16Bold),
                      SizedBox(width: Get.width*0.01,),
                      Text("",style: AppStyle.playFont16Bold.copyWith(color: Colors.red)),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
