import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/Screen/home_screen.dart';
import 'package:medical_app/authantication/OtpScreen.dart';
import 'package:medical_app/authantication/RegisterationScreen.dart';
import 'package:medical_app/constants/ApiConst.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';
import 'package:medical_app/routes.dart';
import 'package:medical_app/utilities/apiClients.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _isGmail(String email) {
    return email.endsWith('@gmail.com') ||
        email.endsWith('.com') ||
        email.endsWith('.co') ||
        email.endsWith('.in');
  }

  bool _obsecureText = true;
  void passVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  validateAndSave() async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      updateUser();
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateUser() async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://ec2-54-159-209-201.compute-1.amazonaws.com:8080/user-api/validate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userName": emailController.text,
          "password": passController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response as needed
        print('Response: ${response.body}');
      } else {
        // Request failed, handle the error
        print(
            'Error - Status Code: ${response.statusCode}, Body: ${response.body}');
        // You might want to show an error message to the user here
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      // You might want to show an error message to the user here
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(children: [
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
                      height: size.height * .66,
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: blueColor, width: 2),
                        color: Colors.transparent,
                        // image: const DecorationImage(
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
                              child: InkWell(
                                // onTap: () {
                                //   showDialog(
                                //       context: context,
                                //       builder: (BuildContext context) {
                                //         return AlertDialog(
                                //           content: Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(
                                //                     bottom: 25),
                                //                 child: Container(
                                //                   height: 60,
                                //                   width: 60,
                                //                   decoration: BoxDecoration(
                                //                       border: Border.all(
                                //                           color: Colors.red),
                                //                       borderRadius:
                                //                           BorderRadius.circular(
                                //                               50)),
                                //                   child: const Icon(
                                //                     Icons.close,
                                //                     color: Colors.red,
                                //                     size: 35,
                                //                   ),
                                //                 ),
                                //               ),
                                //               const Text(
                                //                 'Oops...',
                                //                 style: TextStyle(
                                //                     fontWeight: FontWeight.bold,
                                //                     color: Colors.black,
                                //                     fontSize: 24),
                                //               ),
                                //               const Text(
                                //                 'Wrong Answer!',
                                //                 style: TextStyle(
                                //                     fontWeight: FontWeight.w300,
                                //                     color: Colors.black,
                                //                     fontSize: 18),
                                //               ),
                                //               Padding(
                                //                 padding:
                                //                     const EdgeInsets.symmetric(
                                //                         vertical: 10),
                                //                 child: TextButton(
                                //                   onPressed: () {
                                //                     Navigator.of(context).pop();
                                //                   },
                                //                   child: Container(
                                //                     width: 70,
                                //                     decoration: BoxDecoration(
                                //                         color: Color.fromARGB(
                                //                             255, 130, 132, 223),
                                //                         borderRadius:
                                //                             BorderRadius
                                //                                 .circular(7)),
                                //                     child: const Center(
                                //                       child: Padding(
                                //                         padding:
                                //                             EdgeInsets.all(5.0),
                                //                         child: Text(
                                //                           "OK",
                                //                           style: TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold,
                                //                               color:
                                //                                   Colors.white,
                                //                               fontSize: 20),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               const Text(
                                //                 'Right Answer is:',
                                //                 style: TextStyle(
                                //                     fontWeight: FontWeight.w300,
                                //                     color: Colors.black,
                                //                     fontSize: 18),
                                //               ),
                                //             ],
                                //           ),
                                //         );
                                //       });
                                // },
                                child: Text(
                                  "Welcome!",
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              color: blueColor,
                              thickness: 4,
                              endIndent: 170,
                              indent: 170,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                              ),
                              child: Column(
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Email ID/Username",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: authscreenTextcolor),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: emailController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'your email id...',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: Icon(
                                                  Icons.email_outlined,
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
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ),
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Password",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: authscreenTextcolor),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextFormField(
                                              controller: passController,
                                              obscureText: _obsecureText,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'password',
                                                hintStyle: TextStyle(
                                                    color: Color(0xff747474),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      passVisibility();
                                                    },
                                                    icon: Icon(_obsecureText
                                                        ? Icons.lock_outline
                                                        : Icons.lock_open)),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                        horizontal: 16.0),
                                              ),
                                              // validator: (authResult) =>
                                              //     authResult!.length < 8 ||
                                              //             authResult.length > 16
                                              //         ? 'Password should be 8-16 characters.'
                                              //         : null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: validateAndSave,
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
                                          color: authButtoncolor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OtpScreen()));
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: authscreenTextcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen()));
                                  },
                                  child: RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                      text: 'Don’t have account? ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: authscreenTextcolor),
                                    ),
                                    TextSpan(
                                      text: ' Sign up',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: authscreenTextcolor),
                                    )
                                  ]))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
