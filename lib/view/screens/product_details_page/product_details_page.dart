import 'package:ecommerce_app/view/screens/add_to_cart_page/add_to_cart_page.dart';
import 'package:ecommerce_app/view/screens/add_to_cart_page/chekout_page/checkout_page.dart';
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
              child: const BannerSliderWidgets(
                isVisibleImageNumber: true,
              ),
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
                      
                      /// Favourite Share Button
                      FavouriteShareButtonWidgets(),
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
                  SizedBox(height: Get.height*0.02,),

                  /// Rating Sold Favourite
                  const RatingSoldFavouriteWidgets(),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Product Variation"),
                  SizedBox(height: Get.height*0.01,),
                  const ProductVariationWidgets(),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Delivery"),
                  SizedBox(height: Get.height*0.01,),
                  const DeliveryListViewBuilderWidgets(),
                  SizedBox(height: Get.height*0.02,),

                  const Text("Services"),
                  SizedBox(height: Get.width*0.01,),
                  Row(
                    children: [
                      const Icon(Icons.do_not_disturb_on_total_silence),
                      SizedBox(width: Get.width*0.02,),
                      const Text('7 Days Return'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.do_not_disturb_on_total_silence),
                      SizedBox(width: Get.width*0.02,),
                      const Text('Warranty not available'),
                    ],
                  ),
                  SizedBox(height: Get.height*0.02,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review & Ratings"),
                      Text("View All"),
                    ],
                  ),
                  SizedBox(height: Get.height*0.02,),

                  /// Review ListView
                  const ReviewRatingListWidgets(),
                  SizedBox(height: Get.height*0.02,),

                  /// View More Review Button
                  Center(
                    child: CustomMaterialButton(
                      width: Get.width*0.5,
                      color: Colors.amber,
                      buttonText: 'View More Review',
                      onPressed: (){
                        debugPrint("View More Rating Reviews");
                      },
                    ),
                  ),
                  SizedBox(height: Get.height*0.04,),

                  /// Product Descriptions
                  const Text("Product Descriptions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  const Text("Product Descriptions Product Descriptions Product Descriptions Product Descriptions"),
                  SizedBox(height: Get.height*0.2,),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: const BottomPartWidgets(),
    );
  }
}

class FavouriteShareButtonWidgets extends StatelessWidget {
  const FavouriteShareButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            debugPrint("Favourite Page");
          },
            child: const Icon(Icons.favorite_border_outlined)
        ),
        SizedBox(width: Get.width*0.02,),
        GestureDetector(
          onTap: (){
            debugPrint("Share Product");
          },
            child: const Icon(Icons.share)
        ),
      ],
    );
  }
}

class RatingSoldFavouriteWidgets extends StatelessWidget {
  const RatingSoldFavouriteWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainerWidgets(
          color: Colors.deepOrange,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,color: Colors.amber,),
              SizedBox(width: Get.width*0.01,),
              const Text("4/5"),
            ],
          ),
        ),

        /// Sold
        CustomContainerWidgets(
          color: Colors.blue,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sold'),
              SizedBox(width: Get.width*0.01,),
              const Text("450"),
            ],
          ),
        ),

        /// Favourite
        CustomContainerWidgets(
          color: Colors.teal,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border,color: Colors.amber,),
              SizedBox(width: Get.width*0.01,),
              const Text("560"),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomContainerWidgets extends StatelessWidget {
  const CustomContainerWidgets({
    super.key,
    this.color,
    this.widget,
  });

  final Color? color;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height*0.05,
        width: Get.width*0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
        ),
        child: widget,
    );
  }
}

class ProductVariationWidgets extends StatelessWidget {
  const ProductVariationWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height*0.08,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              debugPrint("$index");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: Get.height,
              width: Get.width*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber
              ),
              child: const Icon(Icons.image),
            ),
          );
        },
      ),
    );
  }
}

class ReviewRatingListWidgets extends StatelessWidget {
  const ReviewRatingListWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fazle Rabbi"),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  )
                ],
              ),
              SizedBox(height: Get.height*0.01,),

              const Text("Review Details Review Details Review Details Review Details Review Details"),
              SizedBox(height: Get.height*0.01,),

              const ReviewImageSliderWidgets(),
              SizedBox(height: Get.height*0.02,),
            ],
          );
        },
    );
  }
}

class BottomPartWidgets extends StatelessWidget {
  const BottomPartWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Get.to(()=> const CheckoutPage());
                },
              ),
              SizedBox(width: Get.width*0.02,),
              CustomMaterialButton(
                color: Colors.white,
                width: Get.width*0.3,
                buttonText: 'Add to Cart',
                onPressed: () {
                  debugPrint("Add to Cart");
                  Get.to(()=> const AddToCartPage());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewImageSliderWidgets extends StatelessWidget {
  const ReviewImageSliderWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height*0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                debugPrint("$index");
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                height: Get.height,
                width: Get.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber
                ),
                child: const Icon(Icons.shop),
              ),
            );
          },
      )
    );
  }
}

class DeliveryListViewBuilderWidgets extends StatelessWidget {
  const DeliveryListViewBuilderWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height*0.1,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            height: Get.height*0.08,
            width: Get.width*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1,color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index==0?const Text("Standard Delivery - 89TK"):index==1?
                const Text("Fastest Delivery - 90TK"):
                const Text("Express Delivery - 98TK"),

                index==0?const Text("Day = 7"):index==1?
                const Text("Day = 2-3 "):
                const Text("Tomorrow"),
              ],
            ),
          );
        },
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
