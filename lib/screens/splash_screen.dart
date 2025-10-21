import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/product_list_page/product_list_page_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds before navigating to main page
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => ProductListPageView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon (can replace with your image asset)
            Icon(Icons.shopping_bag, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              "Shopsy",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
