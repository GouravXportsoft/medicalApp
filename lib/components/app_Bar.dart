import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors_const.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration:
            const BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[]),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'),
              ),
              Image.asset(
                'assets/logo.png',
                scale: 18,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: darkGreenColor,
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
