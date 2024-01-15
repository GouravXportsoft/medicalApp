import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medical_app/components/admin_app_bar.dart';
import 'package:medical_app/components/app_Bar.dart';
import 'package:medical_app/components/bottom_container.dart';
import 'package:medical_app/components/drawer.dart';
import 'package:medical_app/constants/colors_const.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});

  final List tableHeadList = ["Date", "Department", "Doctor", "Lipsom"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const AdminAppBar(),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: lightGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              'User Activity Report',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Table(
                          children: const [
                            TableRow(
                                decoration:
                                    BoxDecoration(color: Color(0xffEAECF0)),
                                children: [
                                  Center(
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Department',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Doctor',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Lipsom',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                          ],
                          // children: List.generate(
                          //     tableHeadList.length,
                          //     (index) => TableRow(
                          //         children: [Text(tableHeadList[index])])),
                          border: TableBorder.all(),
                        )
                      ],
                    ),
                  ),
                  const BottomContainer()
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
