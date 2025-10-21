import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/models/product_model.dart';
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
          return const Center(child: Text("Your cart is empty"));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  Product product = controller.cartItems[index];
                  return ListTile(
                    leading: Image.network(product.image, width: 60),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.removeFromCart(product),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => Text(
                  "Total: \$${controller.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
