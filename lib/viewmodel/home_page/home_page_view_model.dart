import 'package:ecommerce_app/data/repository/home_page_repository.dart';
import 'package:get/get.dart';
import '../../model/all_product_model.dart';

class HomePageViewModel extends GetxController{
  final HomePageRepository _pageRepository = HomePageRepository();

  RxBool isScreenLoading = false.obs;
  RxBool isButtonLoading = false.obs;
  RxString errorMessage = ''.obs;

  RxList categories = [].obs;
  RxInt selectedCategory = (-1).obs;

  Future<void> fetchCategories() async{
    try{
      categories.value = await _pageRepository.getAllCategory();
    }catch(e)
    {
      errorMessage.value = e.toString();
    }
  }

  final productList = <Product>[].obs;
  RxInt selectedProduct = (-1).obs;

  Future<void> fetchProducts() async{
    try{
      final productResponseData = await _pageRepository.getAllProduct();
      productList.addAll(productResponseData);
    }catch(e)
    {
      errorMessage.value = e.toString();
    }
  }

  Future<void> fetchData() async{
    try{
      isScreenLoading.value =true;
      await fetchCategories();
      await fetchProducts();
    }catch(e)
    {
      errorMessage.value = e.toString();
    }finally{
      isScreenLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

}