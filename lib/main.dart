import 'package:crop_disease/history_page.dart';
import 'package:crop_disease/home_page2.dart';
import 'package:crop_disease/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:crop_disease/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crop Disease Detection',
      home: HomePage(),
    );
  }
}
