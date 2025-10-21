import 'package:get/get.dart';
import 'package:shopsy/models/product_model.dart';

class ProductListPageController extends GetxController {
  List products = [
    {
      "id": 1,
      "name": "Nike Shoes",
      "description": "Comfortable running shoes with lightweight cushioning.",
      "type": "Footwear",
      "price": 99.99,
      "image": "https://m.media-amazon.com/images/I/61OtE-mgXmL._SY500_.jpg",
      "specifications":
          "Mesh fabric upper, rubber sole, lightweight (250g), available in Blue/White.",
      "isFavorite": false,
    },
    {
      "id": 2,
      "name": "Strip Shoe",
      "description": "Trendy striped casual shoes for everyday wear.",
      "type": "Footwear",
      "price": 89.99,
      "image":
          "https://m.media-amazon.com/images/I/41AVAwlfWIL._SY395_SX395_QL70_FMwebp_.jpg",
      "specifications":
          "Synthetic leather upper, lace-up closure, white color with black stripes, non-waterproof.",
      "isFavorite": false,
    },
    {
      "id": 3,
      "name": "Classic Leather Shoe",
      "description": "Premium leather shoe with durable sole.",
      "type": "Footwear",
      "price": 119.99,
      "image":
          "https://m.media-amazon.com/images/I/41iWFl52nuL._SY395_SX395_QL70_FMwebp_.jpg",
      "specifications":
          "Made from genuine leather, brown color, polyurethane sole, 6-month warranty.",
      "isFavorite": false,
    },
    {
      "id": 4,
      "name": "MacBook Air",
      "description": "Apple M2 MacBook Air with 13.6-inch Retina display.",
      "type": "Laptop",
      "price": 1099.99,
      "image":
          "https://m.media-amazon.com/images/I/41yniWLSDvL._SY300_SX300_QL70_FMwebp_.jpg",
      "specifications":
          "Apple M2 chip, 8GB unified memory, 256GB SSD, 13.6-inch Retina display, fanless design.",
      "isFavorite": false,
    },
    {
      "id": 5,
      "name": "MacBook Pro 14”",
      "description": "Powerful laptop with M3 Pro chip for professionals.",
      "type": "Laptop",
      "price": 1799.99,
      "image": "https://m.media-amazon.com/images/I/71Ms3-J8bXL._SY450_.jpg",
      "specifications":
          "Apple M3 Pro chip, 16GB RAM, 512GB SSD, 14-inch Liquid Retina XDR display, 18-hour battery life.",
      "isFavorite": false,
    },
    {
      "id": 6,
      "name": "MacBook Pro 16”",
      "description": "High-performance laptop for creative workflows.",
      "type": "Laptop",
      "price": 2399.99,
      "image": "https://m.media-amazon.com/images/I/513p8BwV-RL._AC_UY218_.jpg",
      "specifications":
          "Apple M3 Max chip, 32GB unified memory, 1TB SSD, 16-inch Retina XDR display, aluminum body.",
      "isFavorite": false,
    },
    {
      "id": 7,
      "name": "Redmi A5",
      "description": "Affordable smartphone with excellent battery life.",
      "type": "Mobile",
      "price": 149.99,
      "image": "https://m.media-amazon.com/images/I/51eFLXNsdCL._SX425_.jpg",
      "specifications":
          "6.5-inch HD+ display, 5000mAh battery, 13MP rear + 5MP front camera, 64GB storage.",
      "isFavorite": false,
    },
    {
      "id": 8,
      "name": "Realme Narzo A5",
      "description": "Stylish budget smartphone with smooth display.",
      "type": "Mobile",
      "price": 169.99,
      "image": "https://m.media-amazon.com/images/I/71Vjn1DfArL._AC_UY218_.jpg",
      "specifications":
          "6.6-inch 90Hz display, Helio G85 processor, 5000mAh battery, 128GB storage.",
      "isFavorite": false,
    },
    {
      "id": 9,
      "name": "Realme 14 Pro",
      "description": "5G smartphone with great camera and fast charging.",
      "type": "Mobile",
      "price": 299.99,
      "image": "https://m.media-amazon.com/images/I/5155PFA2N+L._AC_UY218_.jpg",
      "specifications":
          "6.7-inch AMOLED display, Snapdragon 7s Gen 2 chip, 5000mAh battery, 67W fast charging.",
      "isFavorite": false,
    },
    {
      "id": 10,
      "name": "Kookaburra Cricket Bat",
      "description": "Professional-grade English willow bat for power hitters.",
      "type": "Sports",
      "price": 249.99,
      "image":
          "https://m.media-amazon.com/images/I/41KtIVXAWAL._SY300_SX300_QL70_FMwebp_.jpg",
      "specifications":
          "Grade 1 English willow, lightweight design (1.2kg), thick edges, pre-knocked for performance.",
      "isFavorite": false,
    },
    {
      "id": 11,
      "name": "MRF Cricket Bat",
      "description": "Lightweight bat designed for maximum shot control.",
      "type": "Sports",
      "price": 199.99,
      "image":
          "https://m.media-amazon.com/images/I/41KtIVXAWAL._SY300_SX300_QL70_FMwebp_.jpg",
      "specifications":
          "Premium English willow, medium weight, curved blade design, ideal for professional players.",
      "isFavorite": false,
    },
    {
      "id": 12,
      "name": "Fire-Boltt Smart Watch",
      "description":
          "Feature-packed smartwatch with fitness and health tracking.",
      "type": "Smart Watch",
      "price": 79.99,
      "image": "https://m.media-amazon.com/images/I/819DWQLgjKL._AC_UY218_.jpg",
      "specifications":
          "1.8-inch HD display, Bluetooth calling, SpO2 monitor, heart rate sensor, up to 5-day battery life.",
      "isFavorite": false,
    },
    {
      "id": 13,
      "name": "Noise Twist",
      "description": "Bluetooth smartwatch with heart rate and step monitor.",
      "type": "Smart Watch",
      "price": 69.99,
      "image": "https://m.media-amazon.com/images/I/61-vRq2ulOL._AC_UY218_.jpg",
      "specifications":
          "1.4-inch color display, IP67 water resistant, Bluetooth 5.3, 7-day battery backup.",
      "isFavorite": false,
    },
  ];

  RxList productList = [].obs;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    productList.value = products.map((e) => Product.fromJson(e)).toList();
  }
}
