import 'package:flutter/material.dart';
import 'package:lab_2/models/product.dart';

class ItemInfo extends StatelessWidget {
  Product product;
  ItemInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detailed info', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.grey.shade600,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const Center(child: Text('Here should be some detailed info', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32))),
    );
  }
}