import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/Screen/medicine_screen.dart';
import 'package:medical_app/components/app_Bar.dart';
import 'package:medical_app/components/bottom_container.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';
import 'package:medical_app/constants/string_const.dart';

class LabUpload extends StatefulWidget {
  LabUpload({super.key});

  @override
  State<LabUpload> createState() => _LabUploadState();
}

class _LabUploadState extends State<LabUpload> {
  final List gridImages = [
    labImg,
    medicineImg,
    serviceImg,
    doctorImg,
    optionalImg,
    optionalImg
  ];

  final List gridImagesText = [
    labText,
    medicineText,
    serviceText,
    doctorText,
    optionText,
    option2Text
  ];

  File? _pickedImage;
  Future<void> _pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
      print("Image path: ${image.path}");
    } else {
      // User canceled the image picking
      print("Image picking canceled");
    }
  }

  Future<void> _captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
      print("Image path: ${image.path}");
    } else {
      // User canceled the image capturing
      print("Image capturing canceled");
    }
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      // Do something with the selected/captured image
      print("Image path: ${image.path}");
    } else {
      // User canceled the image picking/capturing
      print("Image picking/capturing canceled");
    }
  }

  List<Color> gradiantcontainerColor = [Color(0xff55BE00), Color(0xff3171DD)];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const CustomeAppBar(),
          ),
          Expanded(
            child: Stack(fit: StackFit.loose, children: [
              Positioned(
                bottom: 5,
                child: Image.asset(
                  bgImg,
                  color: bgImageColor,
                ),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  _showImageSourceDialog(context);
                                },
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38),
                                      color: const Color.fromARGB(
                                          255, 255, 247, 233),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: _pickedImage != null
                                      ? Image.file(_pickedImage!)
                                      : const Column(children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Icon(
                                            Icons.add,
                                            color: Color(0xff439488),
                                            size: 25,
                                          ),
                                          Text(
                                            uploadText,
                                            style: TextStyle(
                                                color: Color(0xff439488),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ]),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xff55BC07),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    labAnalysisText,
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    labRecomedText,
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        itemCount: gridImages.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              // Set the selected index to the tapped item
                              setState(() {
                                selectedIndex = index;
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MedicineScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width / 3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: selectedIndex == index
                                        ? [Colors.white, Colors.white]
                                        : gradiantcontainerColor,
                                    end: Alignment.bottomRight,
                                    begin: Alignment.topLeft,
                                  ),
                                  border: Border.all(color: gridTextColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      gridImages[index],
                                      scale: 3,
                                      color: selectedIndex == index
                                          ? Colors.green
                                          : whiteColor,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      gridImagesText[index],
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.green
                                              : whiteColor,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .25,
                  )
                ],
              ),
            ]),
          ),
          const BottomContainer()
        ],
      ),
    );
  }
}
