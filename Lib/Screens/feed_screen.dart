import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'catalog_screen.dart';
import 'live_screen.dart';

class FeedScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "Auriculares inalámbricos", "price": "50 USD"},
    {"name": "Mochila multifuncional", "price": "35 USD"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feed de Productos")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            name: products[index]["name"]!,
            price: products[index]["price"]!,
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "catalog",
            child: Icon(Icons.list),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => CatalogScreen()));
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "live",
            child: Icon(Icons.videocam),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LiveScreen()));
            },
          ),
        ],
      ),
    );
  }
}