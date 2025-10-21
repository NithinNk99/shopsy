import 'package:get/get.dart';
import 'package:shopsy/screens/product_list_page/product_list_page_controller.dart';

class ProductListPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListPageController());
  }
}
