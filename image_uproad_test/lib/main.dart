import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(Image_widget());
}

class Image_widget extends StatefulWidget {
  const Image_widget({super.key});

  @override
  State<Image_widget> createState() => _Image_widgetState();
}

class _Image_widgetState extends State<Image_widget> {
  File? ImageFile;

  Future<XFile?> TakePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    return photo;
  }

  Future<void> PickImage() async {
    final ImagePicker picker = ImagePicker();

    final imageData = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (imageData != null) {
        print(imageData.path.toString());
        ImageFile = File(imageData.path);
      } else {
        print("not Image");
      }
    });
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
            onPressed: () async {
              await PickImage();
            },
            child: Text("pick Image"),
          ),
          Center(
            child: ImageFile == null
                ? const Text("not found Image")
                : Image.file(
                    ImageFile!,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
          )
        ],
      ),
    );

    return MaterialApp(
      home: scaffold,
    );
  }
}
