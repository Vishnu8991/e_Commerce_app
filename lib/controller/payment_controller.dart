import 'package:get/get.dart';

class PaymentController extends GetxController {
  
  var selectedPayment = 0.obs;
  
  void selectPayment(int index) {
    selectedPayment.value = index;
  }
}