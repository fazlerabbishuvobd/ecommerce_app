import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/firestore/cart_model.dart';
import 'package:get/get.dart';

class FireStoreHelper {
  final _db = FirebaseFirestore.instance.collection('cart');

  Future<void> addInfo(CartModel model) async {
    Map<String, dynamic> data = {
      'itemName': model.itemName,
      'details': model.details,
      'imageUrl': model.imageUrl,
      'price': model.price,
      'quantity': model.quantity,
      'uid': model.uid,
    };
    await _db.doc().set(data);
  }

  Future<void> incrementQuantity(documentId) async {
    try {

      DocumentReference docRef = _db.doc(documentId);
      DocumentSnapshot documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        int currentQuantity = documentSnapshot.get('quantity') ?? 0;
        int updatedQuantity = currentQuantity + 1;

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
      DocumentReference docRef = _db.doc(documentId);
      DocumentSnapshot documentSnapshot = await docRef.get();

      if (documentSnapshot.exists) {
        int currentQuantity = documentSnapshot.get('quantity') ?? 0;
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

  Stream<QuerySnapshot> getFilteredDocumentsStream({required String uid}) {
    Query query = _db.where('uid', isEqualTo: uid);
    return query.snapshots();
  }

  Future<void> deleteInfo(String index) async{
    await _db.doc(index).delete();
  }
}