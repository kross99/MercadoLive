import 'package:flutter/material.dart';
import 'live_screen.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo'),
      ),
      body: Center(
        child: Text('Catálogo de productos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LiveScreen()),
          );
        },
        child: Icon(Icons.live_tv),
        tooltip: 'En Vivo',
      ),
    );
  }
}
