import 'package:get/get.dart';

class CheckoutPageViewModel extends GetxController{
  RxBool isOrderButtonLoading = false.obs;
  RxInt selectedDeliveryType = (-1).obs;

  ///*********** Confirm Order Page ********************
  RxBool isContinueButtonLoading = false.obs;

}