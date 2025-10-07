import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Item'),
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman Item!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
