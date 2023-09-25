import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/routes/app_routes_name.dart';
import '../../../utils/app_style.dart';
import '../../../viewmodel/home_page/home_page_view_model.dart';
class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final searchController = TextEditingController();
  final getController = Get.put(HomePageViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.1,
        title: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppStyle.radius10),
            color: Colors.white,
          ),
          child: TextFormField(
            autofillHints: const [AutofillHints.name],
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Smartphone",
              hintStyle: AppStyle.playFont.copyWith(fontSize: 18),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              suffix: Padding(
                padding: const EdgeInsets.only(right: AppStyle.padding10),
                child: GestureDetector(
                  onTap: () => searchController.text ='',
                    child: const Icon(Icons.cancel)
                ),
              )
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppStyle.padding10),
            child: GestureDetector(
              onTap: ()async{
                debugPrint('Searching........');
                getController.isScreenLoading.value = true;
                await Future.delayed(const Duration(seconds: 1));
                await getController.fetchSearchItem(searchController.text);
                getController.isScreenLoading.value = false;
              },
                child: const Icon(Icons.search)
            ),
          )
        ],
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppStyle.padding10),
        child: Obx(() => getController.isScreenLoading.value ==true?
        const Center(child: CircularProgressIndicator()):
        SingleChildScrollView(
            child: getController.searchItemList.isEmpty?
            Container(
              alignment: Alignment.center,
              height: Get.height*0.8,
                child: Text("No Item Found",style: AppStyle.playFontBold,)
            ): ProductGridViewWidgets(getController: getController)
        )

        ),
      )

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
        itemCount: getController.searchItemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          var productInfo = getController.searchItemList[index];
          double regularPrice = (productInfo.price! * productInfo.discountPercentage!)/100;
          return GestureDetector(
            onTap: (){
              debugPrint("$index");
              getController.selectedSearchItem.value = index;
              Get.toNamed(AppRouteName.productDetailsPage,arguments: productInfo);
            },
            child: Obx(() {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius10),
                  color: getController.selectedSearchItem.value == index?Colors.blue.withOpacity(0.3):Colors.transparent,
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
