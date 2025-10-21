import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/models/product_model.dart';
import 'package:shopsy/screens/cart_page/cart_page_controller.dart';
import 'package:shopsy/screens/product_detail_page/product_detail_page_controller.dart';

class ProductDetailView extends GetView<ProductDetailPageController> {
  final Product product;
  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      bottomNavigationBar: _bottomNavigation(),
      body: _body(context),
    );
  }

  Widget _bottomNavigation() {
    final CartController cartController = Get.find<CartController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Obx(() {
              final cartItem = cartController.cartItems.firstWhereOrNull(
                (item) => item.product.id == product.id,
              );

              if (cartItem == null) {
                return ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.green.shade300),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.green,
                        size: 26,
                      ),
                      onPressed: () {
                        cartController.decreaseQuantity(product);
                      },
                    ),
                    Text(
                      "${cartItem.quantity}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                        size: 26,
                      ),
                      onPressed: () {
                        cartController.addToCart(product);
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _body(context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.shade100,
                          Colors.purple.shade50,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Hero(
                      tag: product.image,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.error,
                              size: 50,
                              color: Colors.red,
                            ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 18,
                            ),
                          ),
                          onPressed: () => Get.back(),
                        ),
                        IconButton(
                          icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.redAccent,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "₹${product.price.toStringAsFixed(2)}",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Chip(
                      label: Text(
                        product.type,
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: const Color.fromARGB(255, 234, 223, 255),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text(
                      "Specifications",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.specifications,
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
