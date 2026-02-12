import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('En Vivo'),
      ),
      body: Center(
        child: Text('Pantalla de transmisión en vivo'),
      ),
    );
  }
}
