import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/screens/splash_screen.dart';

void main() async {
  runApp(const ShopsyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
}

class ShopsyApp extends StatelessWidget {
  const ShopsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'Shopsy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const SplashView(),
      ),
    );
  }
}
