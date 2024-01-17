import 'package:flutter/material.dart';
import 'package:medical_app/Screen/lab_upload.dart';
import 'package:medical_app/components/app_Bar.dart';
import 'package:medical_app/components/bottom_container.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';
import 'package:medical_app/constants/string_const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
    return Scaffold(
      body: Column(
        children: [
          const CustomeAppBar(),
<<<<<<< HEAD
          Expanded(
            child: SingleChildScrollView(
              child: Stack(children: [
                // Image.asset(
                //   bgImg,
                //   color: const Color(0xff91C9C4),
                // ),
                Stack(children: [
                  Positioned(
                    bottom: -60,
                    child: Image.asset(
                      bgImg,
                      color: bgImageColor,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Column(
                        children: [
                          Image.asset(bannerImg),
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: gridImages.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 14 / 9,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15),
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LabUpload()));
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: lightGreenColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          gridImages[index],
                                          scale: 2,
                                          color: textColor,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          gridImagesText[index],
                                          style: const TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
=======
          Stack(children: [
            // Image.asset(
            //   bgImg,
            //   color: const Color(0xff91C9C4),
            // ),
            Expanded(
              child: Stack(children: [
                Positioned(
                  bottom: -60,
                  child: Image.asset(
                    bgImg,
                    color: bgImageColor,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      children: [
                        Image.asset(bannerImg),
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: gridImages.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 14 / 9,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LabUpload()));
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: lightGreenColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        gridImages[index],
                                        scale: 2,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        gridImagesText[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ]),
          const SizedBox(
            height: 20,
>>>>>>> 967bb1d9e6732ac277f71aa61b4ebf08d5e2b028
          ),
          const BottomContainer()
        ],
      ),
    );
  }
}
