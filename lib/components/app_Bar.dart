import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
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
                    color: Colors.green,
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
