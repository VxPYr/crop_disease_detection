import 'package:crop_disease/history_page.dart';
import 'package:crop_disease/home_page.dart';
import 'package:crop_disease/settings_page.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures full width
      height: 100,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
        children: [
          GestureDetector(
            child: _buildIcon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: _buildIcon(Icons.search)),
          _buildIcon(Icons.scanner),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
              child: _buildIcon(Icons.history)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: _buildIcon(Icons.settings),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8), // Padding inside border
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes the container circular
        border: Border.all(color: Colors.white, width: 2), // White border
      ),
      child: Icon(
        icon,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
