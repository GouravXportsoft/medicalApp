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
  final List listImages = [
    labImg,
    medicineImg,
    serviceImg,
    doctorImg,
    optionalImg,
    optionalImg
  ];

  final List listImagesText = [
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
              child: Text("Camera"),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const CustomeAppBar(),
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
                                color: const Color.fromARGB(255, 255, 247, 233),
                                borderRadius: BorderRadius.circular(8)),
                            child: _pickedImage != null
                                ? Image.file(_pickedImage!)
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: Color(0xff439488),
                                          size: 40,
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
                              color: lightGreenColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              labAnalysisText,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
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
                              color: const Color(0xff3273DA),
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
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: ListView.builder(
                          itemCount: listImages.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MedicineScreen()));
                                    },
                                    child: Container(
                                      height: size.height / 3,
                                      width: size.width * .3,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff7B9B41)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            listImages[index],
                                            scale: 2,
                                            color: const Color(0xff7B9B41),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Center(
                                            child: Text(
                                              listImagesText[index],
                                              style: const TextStyle(
                                                  color: Color(0xff7B9B41),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * .1),
                    child: const BottomContainer(),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
