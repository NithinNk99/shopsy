import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/models/product_model.dart';
import 'package:shopsy/screens/cart_page/cart_page_controller.dart';
import 'package:shopsy/screens/product_detail_page/product_detail_page_controller.dart';

class ProductDetailView extends GetView<ProductDetailPageController> {
  final Product product;

  ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image, height: 200),
            const SizedBox(height: 16),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // cartController.addToCart(product);
                // Get.snackbar("Added to Cart", product.name);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
