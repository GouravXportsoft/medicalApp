import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  String? _selectedImagePath;
  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Show a dialog or use any other method to let the user choose between camera and gallery
    // For simplicity, I'm using a hypothetical method _showImageSourceDialog.
    String? chosenSource = await _showImageSourceDialog();

    if (chosenSource == 'camera') {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _selectedImagePath = pickedFile.path;
        });
      }
    } else if (chosenSource == 'gallery') {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImagePath = pickedFile.path;
        });
      }
    }
  }

  Future<String?> _showImageSourceDialog() async {
    // You can use a package like `flutter/cupertino.dart` for an iOS-style dialog.
    // For simplicity, I'm using the default `showDialog` method here.

    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Choose Image Source',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 143, 93, 18)),
            ),
          ),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: const Column(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                      ),
                      Text('camera')
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop('camera');
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Column(
                    children: [
                      Icon(CupertinoIcons.cloud_upload),
                      Text('gallery')
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop('gallery');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 145, 182, 216),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.blue,
          title: Text(
            'Logo name',
            style: TextStyle(color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Text('Upload Image'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _selectedImagePath != null
                ? Image.file(
                    File(_selectedImagePath!),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.purple)),
                          onPressed: () {},
                          child: Text(
                            'Lap Analysis',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.purple)),
                          onPressed: () {},
                          child: Text(
                            'Lap Recomedations',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Back')),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber)),
                          onPressed: () {},
                          child: Text(
                            'LogOut',
                          )),
                    ],
                  ),
                ),
              ),
            )

            // Expanded(
            //   child: GridView.builder(
            //       itemCount: _selectedImagePath!.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 3),
            //       itemBuilder: (context, index) {
            //         return Image.file(
            //           File(_selectedImagePath![index]),
            //           width: 100,
            //           height: 100,
            //           fit: BoxFit.cover,
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
