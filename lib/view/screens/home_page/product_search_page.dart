import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_style.dart';
class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final searchController = TextEditingController();

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
              onTap: (){
                debugPrint('Searching........');
              },
                child: const Icon(Icons.search)
            ),
          )
        ],
        backgroundColor: Colors.amber,
      ),

    );
  }
}
