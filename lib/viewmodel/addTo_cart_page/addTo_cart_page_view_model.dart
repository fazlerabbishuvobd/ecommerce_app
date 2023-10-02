import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCartPageViewModel extends GetxController{
  RxBool isCheckoutButtonLoading = false.obs;
  RxString uidS = ''.obs;
  RxBool isLoading = false.obs;

  getUid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      isLoading.value =true;
      uidS.value = sharedPreferences.getString('uid')!;
      isLoading.value = false;
    } catch (e) {
      print('Error retrieving uid: $e');
    }
  }

}
