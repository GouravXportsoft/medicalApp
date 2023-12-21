import 'package:flutter/material.dart';
import 'package:medical_app/components/app_Bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [CustomeAppBar()],
      ),
    );
  }
}
