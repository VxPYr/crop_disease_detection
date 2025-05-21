import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImageScreen extends StatelessWidget {
  final File imageFile;

  const DisplayImageScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanned Image"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}
