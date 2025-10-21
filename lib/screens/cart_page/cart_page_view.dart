import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/cart_page/cart_page_controller.dart';
import 'package:shopsy/screens/cart_page/success_page.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${controller.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.clearCart();
                  Get.off(() => const SuccessPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  AppBar _appBar() => AppBar(
    title: const Text("Your Cart", style: TextStyle(color: Colors.white)),
    backgroundColor: const Color.fromARGB(255, 197, 173, 238),
  );

  Widget _body(context) => Obx(() {
    if (controller.cartItems.isEmpty) {
      return const Center(child: Text("Your cart is empty"));
    }
    return ListView.builder(
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        final item = controller.cartItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ListTile(
            leading: Image.network(item.product.image, width: 50),
            title: Text(item.product.name),
            subtitle: Text(
              "₹${item.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => controller.decreaseQuantity(item.product),
                  ),
                  Text(
                    "${item.quantity}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => controller.addToCart(item.product),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  });
}
