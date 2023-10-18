import 'package:ecommerce_app/data/repository/home_page_repository.dart';
import 'package:get/get.dart';
import '../../model/all_product_model.dart';

class HomePageViewModel extends GetxController{
  final HomePageRepository _pageRepository = HomePageRepository();

  RxBool isScreenLoading = false.obs;
  RxBool isButtonLoading = false.obs;
  RxString errorMessage = ''.obs;

  RxList searchItemList = [].obs;
  RxInt selectedSearchItem =(-1).obs;

  Future<void> fetchSearchItem(String keywords) async{
    try{
      final searchItem = await _pageRepository.getSearchProduct(keywords);
      searchItemList.clear();
      searchItemList.addAll(searchItem);
    }catch(e)
    {
      errorMessage.value = e.toString();
    }
  }

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

  RxList categoryWiseProducts =[].obs;
  Future<void> fetchCategoryWiseProduct(String category) async{
    try{
      isScreenLoading.value = true;
      categoryWiseProducts.value = await _pageRepository.getCategoryWiseProduct(category);
      isScreenLoading.value = false;
    }catch(e)
    {
      errorMessage.value = e.toString();
    }
  }


  final productList = <Product>[].obs;
  RxInt selectedProduct = (-1).obs;
  RxBool hasMore = true.obs;
  int limit = 20;
  Future<void> fetchProducts() async{
    try{
      final productResponseData = await _pageRepository.getAllProduct(limit);
      productList.addAll(productResponseData);
    }catch(e)
    {
      errorMessage.value = e.toString();
    }
  }

  Future<void> fetchMoreProducts() async{
    try{
      isButtonLoading.value = true;
      final productResponseData = await _pageRepository.getAllProduct(limit+=20);
      await Future.delayed(const Duration(seconds: 1));
      productList.clear();
      productList.addAll(productResponseData);
      isButtonLoading.value = false;
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