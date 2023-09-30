import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/firestore/cart_model.dart';

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

  Future<void> updateInfo(CartModel model) async {
    Map<String, dynamic> data = {
      'itemName': model.itemName,
      'details': model.details,
      'imageUrl': model.imageUrl,
      'price': model.price,
      'quantity': model.quantity,
      'uid': model.uid,
    };
    await _db.doc(model.id).update(data);
  }

  Future<void> deleteInfo(String index) async{
    await _db.doc(index).delete();
  }
}