import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crop Disease Detection',
          style: TextStyle(
            backgroundColor: Colors.green,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
    );
  }
}
