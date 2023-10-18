import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/viewmodel/home_page/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/routes/app_routes_name.dart';
import '../../../utils/app_style.dart';
class CategoryWiseProduct extends StatefulWidget {
  const CategoryWiseProduct({super.key,required this.categoryName});
  final String categoryName;

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  final getController = Get.put(HomePageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (getController.isScreenLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ProductGridViewWidgets(getController: getController);
          }
        }),
      ),
    );
  }
}


class ProductGridViewWidgets extends StatelessWidget {
  const ProductGridViewWidgets({
    super.key,
    required this.getController,
  });

  final HomePageViewModel getController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getController.categoryWiseProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          var productInfo = getController.categoryWiseProducts[index];
          double regularPrice = (productInfo.price! * productInfo.discountPercentage!)/100;
          return GestureDetector(
            onTap: (){
              debugPrint("$index");
              getController.selectedProduct.value = index;
              Get.toNamed(AppRouteName.productDetailsPage,arguments: productInfo);
            },
            child: Obx(() {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                  color: getController.selectedProduct.value == index?Colors.blue.withOpacity(0.3):Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppStyle.padding10),topRight: Radius.circular(AppStyle.padding10)),
                      child: CachedNetworkImage(
                        imageUrl: "${productInfo.thumbnail}",height: Get.height*0.17,width: Get.width,fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.amber,)),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(AppStyle.padding5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Product Title
                          Text('${productInfo.title}',
                            style: AppStyle.playFontBold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppStyle.height10,

                          /// Rating - Stock
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,color: Colors.deepOrange,),
                                  Text('${productInfo.rating}/5',style: AppStyle.playFont,),
                                ],
                              ),
                              AppStyle.width20,
                              Text('Stock - ${productInfo.stock}',style: AppStyle.playFont,),
                            ],
                          ),
                          AppStyle.height10,

                          /// Product Price
                          Row(
                            children: [
                              Text('\$${productInfo.price}',
                                  style: AppStyle.playFont16Bold.copyWith(color: Colors.deepOrange)
                              ),
                              AppStyle.width20,
                              Text('\$${regularPrice.toStringAsFixed(2)}',
                                style: AppStyle.playFont.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );

        }
    );
  }
}
