import 'package:ecommerce_app/data/services/api/api_services.dart';
import 'package:ecommerce_app/model/all_product_model.dart';
import 'package:ecommerce_app/resources/app_api_url/app_api_url.dart';

class HomePageRepository{

  ApiServices apiServices = ApiServices();

  /// Fetch Categories
  Future<List<dynamic>> getAllCategory() async{
    List<dynamic> responseData = await apiServices.getApi(AppApiUrl.categories);
    return responseData;
  }

  /// Fetch Products
  Future<List<Product>> getAllProduct() async{
    final jsonRawData = await apiServices.getApi(AppApiUrl.products);
    List<dynamic> productJson = jsonRawData['products'];
    return productJson.map((e) => Product.fromJson(e)).toList();
  }

}