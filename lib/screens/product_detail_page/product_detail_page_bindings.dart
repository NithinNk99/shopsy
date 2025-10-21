import 'package:get/get.dart';
import 'package:shopsy/screens/product_detail_page/product_detail_page_controller.dart';

class ProductDetailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailPageController());
  }
}
