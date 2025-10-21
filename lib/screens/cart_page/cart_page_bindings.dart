import 'package:get/get.dart';
import 'package:shopsy/screens/cart_page/cart_page_controller.dart';

class CartPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
