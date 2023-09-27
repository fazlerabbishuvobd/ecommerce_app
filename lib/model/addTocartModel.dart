class AddToCartModel {
  final String? productImage, details;
  final String title;
  final double price;
  int quantity;

  AddToCartModel({
    required this.title,
    this.productImage,
    this.details,
    required this.quantity,
    required this.price,
  });
}
