import 'package:ecommerce_app/data/repository/home_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/all_product_model.dart';

class HomePageViewModel extends GetxController{
  final HomePageRepository _pageRepository = HomePageRepository();

  RxBool isScreenLoading = false.obs;
  RxBool isButtonLoading = false.obs;

  RxList categories = [].obs;
  var allProduct = AllProductModel();


  RxInt selectedCategory = (-1).obs;

  Future<void> fetchCategories() async{
    //isScreenLoading.value = true;
    try{
      categories.value = await _pageRepository.getAllCategory();
    }catch(e)
    {
      debugPrint('View Model ${e.toString()}');
    }
  }

  Future<void> fetchProducts() async{
    try{
      allProduct = await _pageRepository.getAllProduct();
    }catch(e)
    {
      debugPrint(e.toString());
    }
  }


  @override
  void onInit() {
    //fetchCategories();
    super.onInit();
  }

}