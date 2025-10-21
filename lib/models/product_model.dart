class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String specifications;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.specifications,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: (json['price'] as num).toDouble(),
    image: json['image'],
    specifications: json['specifications'],
    isFavorite: json['isFavorite'] ?? false,
  );
}
