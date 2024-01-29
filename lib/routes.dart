import 'package:flutter/material.dart';
import 'package:medical_app/Screen/home_screen.dart';
import 'package:medical_app/authantication/loginScreen.dart';

const intialroute = "/";
const loginScreen = "/login";

const homeScreen = "/home";

final route = {
  loginScreen: (context) => LoginScreen(),
  homeScreen: (context) => HomeScreen(),
};
