import 'package:flutter/material.dart';
import 'package:medical_app/components/drawer.dart';
import 'package:medical_app/constants/colors_const.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.transparent, boxShadow: <BoxShadow>[]),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: () => MyDrawer(), child: const Icon(Icons.menu)),
              Image.asset(
                'assets/logo.png',
                scale: 18,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: lightGreenColor,
                    borderRadius: BorderRadius.circular(6)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
