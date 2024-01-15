import 'package:flutter/material.dart';
import 'package:medical_app/Screen/admin/admin_screen.dart';
import 'package:medical_app/components/app_Bar.dart';
import 'package:medical_app/components/bottom_container.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';
import 'package:medical_app/constants/string_const.dart';

class MedicineScreen extends StatelessWidget {
  MedicineScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const CustomeAppBar(),
          Expanded(
            child: Stack(children: [
              Positioned(
                bottom: 5,
                child: Image.asset(
                  bgImg,
                  color: bgImageColor,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: lightGreenColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Medicine Name/Upload Prescription',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const Text(
                            'OR',
                            style: const TextStyle(
                                color: textColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 247, 233),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: TextField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Write your prescription here',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: gridImages.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 18 / 9,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AdminScreen()));
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: gridTextColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      gridImages[index],
                                      scale: 2,
                                      color: gridTextColor,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      gridImagesText[index],
                                      style: const TextStyle(
                                          color: gridTextColor,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
          const BottomContainer()
        ],
      ),
    );
  }
}
