import 'package:crop_disease/common/footer.dart';
import 'package:crop_disease/components/display_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      // Do something with the image file
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DisplayImageScreen(imageFile: File(photo.path)),
        ),
      );
    }
  }

  Future<void> _pickFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      // Do something with the image file
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DisplayImageScreen(imageFile: File(photo.path)),
        ),
      );
    }
  }

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
                'Home',
                style: TextStyle(fontSize: 34),
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => _openCamera(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickFromGallery(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  "Upload from gallery",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
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
