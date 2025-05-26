import 'package:crop_disease/common/footer.dart';
import 'package:crop_disease/components/display_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:crop_disease/components/result_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _sendImageToBackend(BuildContext context, File imageFile) async {
    final uri = Uri.parse('http://10.0.2.2:5000/predict'); // emulator
    final request = http.MultipartRequest('POST', uri);

    // Attach the image file
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final jsonData = json.decode(respStr);
        print("Backend raw response: $respStr");
        print("Parsed JSON: $jsonData");

        print("Result from backend: $jsonData");
        // String prediction = jsonData['prediction'] ?? 'No prediction';

        String disease = jsonData['disease'] ?? 'Unknown disease';
        String confidence = jsonData['confidence'] ?? 'Unknown confidence';

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(
              disease: disease,
              confidence: confidence,
            ),
          ),
        );
      } else {
        print('Failed to get result: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending image: $e');
    }
  }

  Future<void> _handleImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);

    if (photo != null) {
      File imageFile = File(photo.path);

      // 1. Navigate to DisplayImageScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DisplayImageScreen(imageFile: imageFile),
        ),
      );

      // 2. Send image to backend
      await _sendImageToBackend(context, imageFile);
    }
  }

  Future<void> _openCamera(BuildContext context) =>
      _handleImage(context, ImageSource.camera);

  Future<void> _pickFromGallery(BuildContext context) =>
      _handleImage(context, ImageSource.gallery);

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
