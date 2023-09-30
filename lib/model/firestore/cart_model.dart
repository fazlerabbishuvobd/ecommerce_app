class CartModel {
  String? itemName,id;
  String? details;
  String? imageUrl;
  double? price;
  int? quantity;
  String? uid;

  CartModel({
    this.itemName,
    this.details,
    this.imageUrl,
    this.price,
    this.id,
    required this.uid,
    this.quantity,
  });

  // Factory constructor to create a CartModel from a JSON map
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemName: json['itemName'],
      details: json['details'],
      imageUrl: json['imageUrl'],
      price: json['price']?.toDouble(), // Convert to double if present
      quantity: json['quantity'],
      uid: json['uid'],
      id: json['id'],
    );
  }

  // Method to convert the CartModel to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'itemName': itemName,
      'details': details,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'uid':uid,
      'id':id,
    };
    return data;
  }
}
