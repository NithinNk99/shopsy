import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/models/cart_item.dart';
import 'package:shopsy/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartFromPrefs();
  }

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }

    saveCartToPrefs();

    Get.snackbar(
      "Added to Cart 🛍️",
      product.name,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE8F5E9),
      colorText: const Color(0xFF1B5E20),
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    saveCartToPrefs();
  }

  void clearCart() {
    cartItems.clear();
    saveCartToPrefs();
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  Future<void> saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart_items', cartJson);
  }

  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList('cart_items');

    if (cartJson != null) {
      cartItems.value =
          cartJson.map((e) => CartItem.fromJson(jsonDecode(e))).toList();
    }
  }
}
