import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/constant/app_constant.dart';

class ProductFullImagePage extends StatefulWidget {
  const ProductFullImagePage({super.key});

  @override
  State<ProductFullImagePage> createState() => _ProductFullImagePageState();
}

class _ProductFullImagePageState extends State<ProductFullImagePage> {
  int _sliderImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppStyle.padding10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.cancel,color: Colors.deepOrange,)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height*0.02),
            child: CarouselSlider(
                items: AppConstants.bannerImageList.map((item) {
                  return Image.network(item, scale: 1.5,fit: BoxFit.fill);
                }).toList(),
                options: CarouselOptions(
                  height: Get.height*0.6,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _sliderImageIndex = index;
                    });
                  },
                )
            ),
          ),

          AppStyle.height20,
          Center(
              child: Text("${_sliderImageIndex+1} / ${AppConstants.bannerImageList.length}",style: AppStyle.playFont16Bold,)
          ),

          AppStyle.height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back),
              Text("Swipe",style: AppStyle.playFontBold,),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ],
      ),
    );
  }
}
