import 'dart:io';
import 'dart:math';

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
  List<XFile>? imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();

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

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 145, 182, 216),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.blue,
          title: const Text(
            'Logo name',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
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
                  // _pickImage();
                  selectImages();
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
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.purple)),
                          onPressed: () {},
                          child: const Text(
                            'Lap Analysis',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.purple)),
                          onPressed: () {},
                          child: const Text(
                            'Lap Recomedations',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              // onTap: () => selectImages(),
              child: SizedBox(
                child: InkWell(
                  // onTap: () => selectImages(),
                  child: Container(
                    height:
                        max(size.height / 2, ((20.0) * imageFileList!.length)),
                    width: size.width,
                    color: Colors.grey,

                    child: imageFileList == null
                        ? const Column(
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.grey,
                              ),
                              Text('Please add photo more the one')
                            ],
                          )
                        : imageFileList!.length > 1 || imageFileList == null
                            ? GridView.builder(
                                shrinkWrap: true,
                                itemCount: imageFileList!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                        File(imageFileList![index].path),
                                        fit: BoxFit.cover),
                                  );
                                })
                            : null,

                    // child: Center(
                    //     child: _image == null
                    //         ? Icon(
                    //             Icons.add_a_photo_outlined,
                    //             color: Colors.grey,
                    //           )
                    //         : Image.file(
                    //             _image!,
                    //             fit: BoxFit.fitWidth,
                    //           )),
                  ),
                ),
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
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Back')),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber)),
                          onPressed: () {},
                          child: const Text(
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
