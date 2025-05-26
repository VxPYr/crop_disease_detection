import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  // final String result;

  final String disease;
  final String confidence;

  const ResultScreen({
    super.key,
    required this.disease,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prediction Result")),
      body: Center(
        child: Text(
          '$disease',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
