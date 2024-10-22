// lib/pages/item_info.dart
import 'package:flutter/material.dart';
import 'package:lab_2/models/product.dart';
import 'package:lab_2/pages/Home/components/product_tile.dart';

class ItemInfo extends StatelessWidget {
  final Product? product;

  const ItemInfo({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> nestedList = [
      "Nested String",
      456,
      Product(
        id: 2,
        name: 'Nested Product',
        description: 'Description of nested product.',
        price: 59.99,
        imgUrl: 'https://intertop.ua/load/CE614/412x550/2.jpg',
      ),
    ];
    // Define the list with mixed data types, including nested lists and Product
    final List<dynamic> dataList = [
      "Hello, Flutter!", // String
      123, // int
      45.67, // double
      true, // bool
      Icons.star, // IconData
      'https://via.placeholder.com/150', // Image URL (String)
      Image.asset('lib/assets/images/logo.png'), // Image widget
      Product(
        id: 1,
        name: 'Sample Product',
        description: 'A sample product description.',
        price: 29.99,
        imgUrl: 'https://intertop.ua/load/CE614/412x550/2.jpg',
      ),
      nestedList
    ];

    Widget getWidgetForType(dynamic data) {
      switch (data.runtimeType) {
        case const (String):
          final uri = Uri.tryParse(data);
          if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
            return Image.network(
              data,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'Invalid Image URL',
                  style: TextStyle(color: Colors.red),
                );
              },
            );
          }
          return Text(
            data,
            style: const TextStyle(fontSize: 16),
          );

        case const (int):
        case const (double):
        case const (bool):
          return Text(
            data.toString(),
            style: const TextStyle(fontSize: 16),
          );

        case const (IconData):
          return Icon(
            data,
            size: 30,
            color: Colors.blue,
          );

        case const (Image):
          return data;

        case const (Product):
          return ProductTile(product: data as Product);

        case const (List<dynamic>):
          final List<dynamic> nestedList = data as List<dynamic>;
          return SizedBox(
            height: 600,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nestedList.length,
              itemBuilder: (context, index) {
                final nestedData = nestedList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getWidgetForType(nestedData),
                );
              },
            ),
          );

        default:
          return const Text(
            'Unsupported type',
            style: TextStyle(fontSize: 16, color: Colors.red),
          );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detailed Info',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.grey.shade600,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: getWidgetForType(data),
          );
        },
      ),
    );
  }
}
