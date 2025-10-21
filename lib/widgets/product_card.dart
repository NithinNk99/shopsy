import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image, width: 60, height: 60, fit: BoxFit.cover),
      title: Text(product.name),
      subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
      onTap: onTap,
    );
  }
}
