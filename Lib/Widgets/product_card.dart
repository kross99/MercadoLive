import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  ProductCard({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(price),
        trailing: ElevatedButton(
          child: Text("Comprar"),
          onPressed: () {
            // Aquí se integrará el flujo de pagos
          },
        ),
      ),
    );
  }
}