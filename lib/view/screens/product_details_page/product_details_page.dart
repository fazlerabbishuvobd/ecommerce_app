import 'package:ecommerce_app/utils/app_style.dart';
import 'package:ecommerce_app/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/constant/app_constant.dart';
import '../../../resources/routes/app_routes_name.dart';

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
            padding: const EdgeInsets.only(right: AppStyle.padding10),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(AppRouteName.addToCartPage);
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
              height: Get.height*0.3,
              child: BannerSliderWidgets(
                itemCount: AppConstants.bannerImageList.length,
                imageList: AppConstants.bannerImageList,
                isVisibleImageNumber: true,
                isVisibleSliderDot: false,
              ),
            ),
            AppStyle.height20,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4560.00 TK",style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)),
                      
                      /// Favourite Share Button
                      const FavouriteShareButtonWidgets(),
                    ],
                  ),
                  Row(
                    children: [
                      Text("1230.00 Tk",style: AppStyle.playFont.copyWith(decoration: TextDecoration.lineThrough),),
                      AppStyle.width10,
                      Text("5%",style: AppStyle.playFontBold,),
                    ],
                  ),
                  AppStyle.height20,

                  Text("Product Name",
                    style: AppStyle.playFont16Bold,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis
                  ),
                  AppStyle.height10,

                  /// Rating Sold Favourite
                  const RatingSoldFavouriteWidgets(),
                  AppStyle.height20,

                  Text("Product Variation",style: AppStyle.playFont16Bold),
                  AppStyle.height10,
                  const ProductVariationWidgets(),
                  AppStyle.height20,

                  Text("Delivery",style: AppStyle.playFont16Bold),
                  AppStyle.height10,
                  const DeliveryListViewBuilderWidgets(),
                  AppStyle.height20,

                  Text("Services",style: AppStyle.playFont16Bold),
                  AppStyle.height10,
                  Row(
                    children: [
                      const Icon(Icons.do_not_disturb_on_total_silence),
                      AppStyle.width20,
                      Text('7 Days Return',style: AppStyle.playFont),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.do_not_disturb_on_total_silence),
                      AppStyle.width20,
                      Text('Warranty not available',style: AppStyle.playFont),
                    ],
                  ),
                  AppStyle.height20,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review & Ratings",style: AppStyle.playFont16Bold),
                      Text("View All",style: AppStyle.playFont16Bold),
                    ],
                  ),
                  AppStyle.height20,

                  /// Review ListView
                  const ReviewRatingListWidgets(),
                  AppStyle.height20,

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
                  AppStyle.height20,

                  /// Product Descriptions
                  Text("Product Descriptions", style: AppStyle.playFont16Bold,),
                  Text("Product Descriptions Product Descriptions Product Descriptions Product Descriptions",style: AppStyle.playFont),
                  SizedBox(height: Get.height*0.2),
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
        AppStyle.width20,
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
              AppStyle.width10,
              Text("4.25/5",style: AppStyle.playFontBold,),
            ],
          ),
        ),

        /// Sold
        CustomContainerWidgets(
          color: Colors.blue,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sold',style: AppStyle.playFontBold,),
              AppStyle.width10,
              Text("450",style: AppStyle.playFontBold),
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
              AppStyle.width20,
              Text("560",style: AppStyle.playFontBold),
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
          borderRadius: BorderRadius.circular(AppStyle.radius10),
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
              margin: const EdgeInsets.only(right: AppStyle.padding10),
              height: Get.height,
              width: Get.width*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyle.radius10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fazle Rabbi",style: AppStyle.playFontBold),
                  const Row(
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
              AppStyle.height10,

              Text("Review Details Review Details Review Details Review Details Review Details",style: AppStyle.playFont),
              AppStyle.height10,

              const ReviewImageSliderWidgets(),
              AppStyle.height20,
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
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.padding10),
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
                  Get.toNamed(AppRouteName.checkoutPage);
                },
              ),
              AppStyle.width10,

              CustomMaterialButton(
                color: Colors.white,
                width: Get.width*0.3,
                buttonText: 'Add to Cart',
                onPressed: () {
                  debugPrint("Add to Cart");
                  Get.toNamed(AppRouteName.addToCartPage);
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
                margin: const EdgeInsets.only(right: AppStyle.padding10),
                height: Get.height,
                width: Get.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
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
            margin: const EdgeInsets.only(right: AppStyle.padding10),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppStyle.padding5),
            height: Get.height*0.08,
            width: Get.width*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppStyle.radius10),
              border: Border.all(width: 1,color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index==0?Text("Standard Delivery - 85 TK",style: AppStyle.playFontBold,):
                index==1? Text("Fastest Delivery - 120 TK",style: AppStyle.playFontBold):
                Text("Express Delivery - 150 TK",style: AppStyle.playFontBold),

                index==0?Text("Day = 7",style: AppStyle.playFont):
                index==1?Text("Day = 2-3 ",style: AppStyle.playFont):
                Text("Tomorrow",style: AppStyle.playFont),
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
        borderRadius: BorderRadius.circular(AppStyle.radius10)
      ),
      child: Text('$buttonText',style: AppStyle.playFont16Bold,),
    );
  }
}
