import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/cart_page/cart_page_view.dart';
import 'package:shopsy/screens/product_detail_page/product_detail_page_view.dart';
import 'package:shopsy/screens/product_list_page/product_list_page_controller.dart';
import 'package:shopsy/widgets/product_card.dart';

class ProductListPageView extends StatelessWidget {
  final ProductListPageController controller = Get.put(
    ProductListPageController(),
  );

  ProductListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() => AppBar(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 197, 173, 238),
    title: Text('Shopsy', style: TextStyle(color: Colors.white)),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        onPressed: () => Get.to(() => CartView()),
      ),
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onSelected: (value) {
          if (value == 'logout') controller.logout();
        },
        itemBuilder:
            (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.redAccent),
                    SizedBox(width: 8),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
      ),
    ],
  );

  Widget _body() => Obx(() {
    if (controller.productList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.deepPurple),
      );
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.deepPurple.shade50,
          child: Obx(
            () => Text(
              "Hello, ${controller.username.value.isNotEmpty ? controller.username.value : "Shopper"} 🛍️",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              final product = controller.productList[index];
              return ProductTile(
                product: product,
                onTap: () => Get.to(() => ProductDetailView(product: product)),
              );
            },
          ),
        ),
      ],
    );
  });
}
