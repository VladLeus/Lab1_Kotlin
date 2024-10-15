import 'package:flutter/material.dart';
import 'package:lab_2/models/product.dart';
import 'package:lab_2/pages/Home/components/product_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
 List<Product> _products = [];

  @override
  void initState() {
    super.initState();

    _products = [
      Product(
        id: 1,
        name: 'Air Max 90',
        description: 'A classic and comfortable sneaker.',
        price: 129.99,
        imgUrl: 'https://intertop.ua/load/CE614/412x550/2.jpg',
      ),
      Product(
        id: 2,
        name: 'Adidas Ultraboost',
        description: 'Best in its category for runners.',
        price: 180.00,
        imgUrl: 'https://intertop.ua/load/CN3689/412x550/2.jpg',
      ),
      Product(
        id: 3,
        name: 'Puma RS-X',
        description: 'Stylish and bold design.',
        price: 110.00,
        imgUrl: 'https://intertop.ua/load/CJ1194/412x550/4.jpg',
      ),
      Product(
        id: 4,
        name: 'Reebok Classic',
        description: 'Timeless design for everyday wear.',
        price: 85.50,
        imgUrl: 'https://intertop.ua/load/0B957/412x550/MAIN.jpg',
      ),
      Product(
        id: 5,
        name: 'New Balance 574',
        description: 'A blend of style and comfort.',
        price: 190.00,
        imgUrl: 'https://intertop.ua/load/MG410/412x550/2.jpg',
      ),
      Product(
        id: 6,
        name: 'Converse Chuck Taylor',
        description: 'Iconic sneakers for casual outings.',
        price: 165.00,
        imgUrl: 'https://intertop.ua/load/CB473/412x550/3.jpg',
      ),
      Product(
        id: 7,
        name: 'Vans Old Skool',
        description: 'Classic skate shoes with durable design.',
        price: 75.00,
        imgUrl: 'https://intertop.ua/load/VX1549/412x550/2.jpg',
      ),
      Product(
        id: 8,
        name: 'Jordan 1 Retro',
        description: 'High demand and stylish basketball sneakers.',
        price: 250.00,
        imgUrl: 'https://intertop.ua/load/CE784/412x550/MAIN.jpg',
      ),
      Product(
        id: 9,
        name: 'Asics Gel-Kayano',
        description: 'High-performance running shoes.',
        price: 160.00,
        imgUrl: 'https://intertop.ua/load/6B457/412x550/MAIN.jpg',
      ),
      Product(
        id: 10,
        name: 'Nike Zoom Pegasus',
        description: 'Versatile sneakers for runners and gym-goers.',
        price: 120.00,
        imgUrl: 'https://intertop.ua/load/CE600/412x550/2.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hot Picks 🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'Explore them now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ProductTile(product: _products[index]),
          ),
        ),
      ],
    );
  }
}
