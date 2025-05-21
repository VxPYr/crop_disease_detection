import 'package:crop_disease/common/footer.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
                'History',
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
