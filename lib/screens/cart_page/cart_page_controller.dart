import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/models/cart_item.dart';
import 'package:shopsy/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadCartFromPrefs();
  }

  void addToCart(Product product) async {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
    await saveCartToPrefs();
  }

  void decreaseQuantity(Product product) async {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
      await saveCartToPrefs();
    }
  }

  void removeFromCart(Product product) async {
    cartItems.removeWhere((item) => item.product.id == product.id);
    await saveCartToPrefs();
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
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList('cart_items');
    if (cartJson != null) {
      final loadedItems =
          cartJson.map((e) => CartItem.fromJson(jsonDecode(e))).toList();
      cartItems.assignAll(loadedItems);
    }
    isLoading.value = false;
  }
}
