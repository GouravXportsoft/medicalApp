import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/Screen/home_screen.dart';
import 'package:medical_app/authantication/loginScreen.dart';
import 'package:medical_app/constants/ApiConst.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';
import 'package:medical_app/utilities/apiClients.dart';

import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController DOBcontroller = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController LastName = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isGmail(String email) {
    return email.endsWith('@gmail.com') ||
        email.endsWith('.com') ||
        email.endsWith('.co') ||
        email.endsWith('.in');
  }

  validateAndSave() async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      AddUser();
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      return true;
    } else {
      return false;
    }
  }

  AddUser() async {
    try {
      final response = await http.post(
        Uri.parse(
            "http://ec2-54-159-209-201.compute-1.amazonaws.com:8080/user-api/add"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "password": passController.text,
          "firstName": firstName.text,
          "lastName": LastName.text,
          "email": emailController.text,
          "yearOfBirth": DOBcontroller.text,
          "pin": pinController.text,
          "mobileNumber": phoneController.text,
          "profileAvatar": "string",
          "type": "string",
          "userName": userName.text,
          "creationDate": "2024-01-29T08:57:00.445Z"
        }),
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response as needed
        print('Response: ${response.body}');
      } else {
        // Request failed, handle the error
        print(
            'Error - Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                bottom: 15,
                child: Image.asset(
                  bgImg,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: size.width * .28,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black38, blurRadius: 2)
                          ],
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(53),
                              bottomRight: Radius.circular(53))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 3),
                        child: SizedBox(
                          child: Image.asset(
                            logoImg,
                            // scale: 1.75,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: size.height * .70,
                        decoration: BoxDecoration(
                          border: Border.all(color: blueColor, width: 2),
                          color: Colors.transparent,
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //     bgImg,
                          //   ),
                          //   filterQuality: FilterQuality.high,
                          //   fit: BoxFit.fitWidth,
                          // ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: authscreenTextcolor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: authscreenTextcolor,
                                thickness: 4,
                                endIndent: 150,
                                indent: 150,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "First Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: firstName,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'First Name',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.person_outline,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Last Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: LastName,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Last Name',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.person_outline,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your last name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Username",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: userName,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Select Username',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.person_outline,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your valid username';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Password",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: passController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Password',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.lock,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your password';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Email id",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: emailController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Your email id...',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.mail_outlined,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (authResult) {
                                                if (authResult!.isEmpty ||
                                                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                                        .hasMatch(authResult)) {
                                                  return 'Please enter a valid email';
                                                }

                                                if (!_isGmail(authResult)) {
                                                  return 'Please enter a valid email address';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Mobile Number",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: phoneController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Enter Mobile Number',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.mobile_screen_share,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your phone number';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Pin",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: pinController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Enter your Pin',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.pin,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your pin';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "DOB",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: authscreenTextcolor),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: passController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Enter Your DOB',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.calendar_month,
                                                  color: Color(0xff747474),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your DOB';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: validateAndSave,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 20.0),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xff55BE00),
                                                  Color(0xff3171DD)
                                                ],
                                                end: Alignment.bottomRight,
                                                begin: Alignment.topLeft),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                          child: Text(
                                            "REGISTER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: authscreenTextcolor),
                                    ),
                                    TextSpan(
                                      text: ' Sign In',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: authscreenTextcolor),
                                    )
                                  ]))),
                              const SizedBox(
                                height: 150,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
