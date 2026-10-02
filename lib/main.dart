import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ProductListPage()));

// 1. Data Model
class Product {
  final String name, desc, price;
  final Color color;
  Product(this.name, this.desc, this.price, this.color);
}

// 2. Product List Page
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  static final products = [
    Product('Pixel', 'Pixel is the most featureful phone ever', '800', Colors.blue),
    Product('Laptop', 'Laptop is most productive development tool', '2000', Colors.green),
    Product('Tablet', 'Tablet is the most useful device ever for meeting', '1500', Colors.amber),
    Product('Pendrive', 'iPhone is the stylist phone ever', '100', Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation'), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailPage(product: products[i]))),
          child: Card(
            child: Row(children: [
              Container(width: 120, height: 100, color: products[i].color, child: Center(child: Text(products[i].name.toLowerCase(), style: const TextStyle(color: Colors.white, fontSize: 20)))),
              Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(products[i].name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(products[i].desc),
                Text('Price: ${products[i].price}'),
              ]))),
            ]),
          ),
        ),
      ),
    );
  }
}

// 3. Product Detail Page (Navigates back via default AppBar back button)
class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name), backgroundColor: Colors.blue),
      body: Column(children: [
        Container(height: 250, color: product.color, child: Center(child: Text(product.name.toLowerCase(), style: const TextStyle(color: Colors.white, fontSize: 40)))),
        Padding(padding: const EdgeInsets.all(16.0), child: Column(children: [
          Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(product.desc),
          const SizedBox(height: 20),
          Text('Price: ${product.price}'),
        ])),
      ]),
    );
  }
}