import 'package:flutter/material.dart';
import 'package:medical_app/Screen/home_screen.dart';
import 'package:medical_app/authantication/loginScreen.dart';
import 'package:medical_app/components/app_Bar.dart';
import 'package:medical_app/labscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
<<<<<<< HEAD
      home: HomeScreen(),
=======
      home: const LoginScreen(),
>>>>>>> bedf3ca74d340570bfa4f830438d215a0a67f8e1
    );
  }
}
