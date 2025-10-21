import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/screens/splash_screen.dart';

void main() {
  runApp(const ShopsyApp());
}

class ShopsyApp extends StatelessWidget {
  const ShopsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopsy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashView(), 
    );
  }
}
