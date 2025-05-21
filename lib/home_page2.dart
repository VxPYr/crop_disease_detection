import 'package:crop_disease/common/footer.dart';
import 'package:crop_disease/history_page.dart';
import 'package:crop_disease/home_page.dart';
import 'package:crop_disease/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Searches',
                style: TextStyle(fontSize: 34),
              ),
            ),
          ),

          Column(
            children: [
              Text('Search 1'),
            ],
          ),
          const Spacer(),

          // Footer with equally spaced icons inside bordered containers
          Footer(),
        ],
      ),
    );
  }
}
