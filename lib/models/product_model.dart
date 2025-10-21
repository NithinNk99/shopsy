// lib/models/product_model.dart
class Product {
  final int id;
  final String name;
  final String description;
  final String type;
  final double price;
  final String image;
  final String specifications;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.price,
    required this.image,
    required this.specifications,
  });

  /// Convert Product -> JSON (for SharedPreferences or API)
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'type': type,
    'price': price,
    'image': image,
    'specifications': specifications,
  };

  /// Convert JSON -> Product (for loading from API or local storage)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'] ?? '',
      specifications: json['specifications'] ?? '',
    );
  }
}
