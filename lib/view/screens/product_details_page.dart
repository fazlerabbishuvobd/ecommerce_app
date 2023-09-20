import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
import 'package:ecommerce_app/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.08,
        title: const SearchBarWidgets(),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> const AddToCartPage());
              },
                child: const Icon(Icons.shopping_cart)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: Get.height*0.4,
              color: Colors.deepOrange,
              child: const Text("Product Image Slider"),
            ),
            SizedBox(height: Get.height*0.02,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4560.00 TK"),
                      Row(
                        children: [
                          Icon(Icons.favorite_border_outlined),
                          SizedBox(width: 10,),
                          Icon(Icons.share),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text("1230.00 Tk",style: TextStyle(decoration: TextDecoration.lineThrough),),
                      SizedBox(width: 10,),
                      Text("5%"),
                    ],
                  ),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Product Name",maxLines: 3,overflow: TextOverflow.ellipsis,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review 4.00/5"),
                      Text("Sold 120"),
                      Text("Love 120"),
                    ],
                  ),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Product Variation"),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height*0.08,
                    width: Get.width,
                    color: Colors.blue,
                    child: const Text("Product Variation"),
                  ),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Delivery"),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Services"),
                  SizedBox(height: Get.height*0.02,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review & Ratings"),
                      Text("View All"),
                    ],
                  ),
                  SizedBox(height: Get.height*0.01,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fazle Rabbi"),
                      Text("*****"),
                    ],
                  ),
                  const Text("Review Details"),
                  SizedBox(height: Get.height*0.01,),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height*0.1,
                    color: Colors.red,
                    child: const Text("Review Images"),
                  ),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Product Descriptions"),
                  SizedBox(height: Get.height*0.2,),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: Get.height*0.08,
        color: Colors.deepOrange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.store),
            const Icon(Icons.message),
            Row(
              children: [
                CustomMaterialButton(
                  color: Colors.white,
                  width: Get.width*0.3,
                  buttonText: 'Buy Now',
                  onPressed: () {
                    debugPrint("Buy Now");
                  },
                ),
                SizedBox(width: Get.width*0.02,),
                CustomMaterialButton(
                  color: Colors.white,
                  width: Get.width*0.3,
                  buttonText: 'Add to Cart',
                  onPressed: () {
                    debugPrint("Add to Cart");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.onPressed,
    this.width,
    this.color,
    this.buttonText,
  });

  final VoidCallback? onPressed;
  final double? width;
  final Color? color;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: Get.height*0.06,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text('$buttonText'),
    );
  }
}
