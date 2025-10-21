import 'package:get/get.dart';
import 'package:shopsy/models/product_model.dart';

class ProductListPageController extends GetxController{
  List products = [
  {
    "id": 1,
    "name": "Nike Shoes",
    "description": "Comfortable running shoes",
    "price": 99.99,
    "image": "https://via.placeholder.com/150"
  },
  {
    "id": 2,
    "name": "Apple Watch",
    "description": "Smart watch with fitness tracking",
    "price": 249.99,
    "image": "https://via.placeholder.com/150"
  },
  {
    "id": 3,
    "name": "Wireless Headphones",
    "description": "Noise cancelling over-ear headphones",
    "price": 199.99,
    "image": "https://via.placeholder.com/150"
  }
];
RxList productList =[].obs;
 @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

    Future<void> loadProducts() async {  
    productList.value = products.map((e) => Product.fromJson(e)).toList();
  }
}