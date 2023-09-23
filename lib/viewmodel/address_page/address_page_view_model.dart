import 'package:get/get.dart';

class AddressPageViewModel extends GetxController{
  RxInt selectedAddressLabel = (-1).obs;
  RxBool saveButtonLoading = false.obs;

  ///*************** Update Address Page View Model ***************
  RxInt selectedUpdateAddressLabel = (-1).obs;
  RxBool updateButtonLoading = false.obs;
}