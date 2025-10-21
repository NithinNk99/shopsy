import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/cart_page/cart_page_view.dart';
import 'package:shopsy/screens/product_detail_page/product_detail_page_view.dart';
import 'package:shopsy/screens/product_list_page/product_list_page_controller.dart';
import 'package:shopsy/widgets/product_card.dart';

class ProductListPageView extends GetView<ProductListPageController> {
  ProductListPageView({super.key}) {
    Get.lazyPut(() => ProductListPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopsy"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.to(() => CartView()),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.productList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            return ProductTile(
              product: product,
              onTap: () => Get.to(() => ProductDetailView(product: product)),
            );
          },
        );
      }),
    );
  }
}
