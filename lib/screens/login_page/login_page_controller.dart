import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/screens/product_list_page/product_list_page_view.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter both email and password",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    if (email == "user@shopsy.com" && password == "123456") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Get.offAll(() => ProductListPageView());
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Get.offAll(() => ProductListPageView());
    }
  }
}
