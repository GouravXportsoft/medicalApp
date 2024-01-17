import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/string_const.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff55BE00), Color(0xff3171DD)],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft),
                borderRadius: BorderRadius.circular(6)),
            child: const Center(
              child: Text(
                backText,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(
                  color: darkGreenColor,
                ),
                borderRadius: BorderRadius.circular(6)),
            child: const Center(
              child: Text(
                logOutText,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: darkGreenColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
