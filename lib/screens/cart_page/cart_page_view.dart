import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/cart_page/cart_page_controller.dart';

class CartView extends GetView<CartController> {
  CartView({super.key}) {
    Get.lazyPut(() => CartController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text("Your cart is empty 😕"));
        }
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return ListTile(
              leading: Image.network(item.product.image, width: 50),
              title: Text(item.product.name),
              subtitle: Text(
                "₹${item.totalPrice.toStringAsFixed(2)} (x${item.quantity})",
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.removeFromCart(item.product),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Text(
            "Total: ₹${controller.totalPrice.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
