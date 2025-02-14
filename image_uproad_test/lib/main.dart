import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(Image());
}

class Image extends StatefulWidget {
  const Image({super.key});

  @override
  State<Image> createState() => _ImageState();
}

class _ImageState extends State<Image> {
  final ImagePicker _picker = ImagePicker();

  Future TakePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo;
  }

  Future PickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Image Operation"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              TakePicture();
            },
            child: Text("take picture"),
          ),
          ElevatedButton(
            onPressed: () {
              PickImage();
            },
            child: Text("pick image"),
          ),
        ],
      ),
    );

    return MaterialApp(
      home: scaffold,
    );
  }
}
