import 'package:flutter/material.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 110,
                width: size.width * .28,
                decoration: BoxDecoration(
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
                  decoration: BoxDecoration(
                    border: Border.all(color: blueColor, width: 2),
                    image: DecorationImage(
                      image: AssetImage(
                        bgImg,
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Generate Password",
                          style: TextStyle(
                            color: blueColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Divider(
                        color: blueColor,
                        thickness: 4,
                        endIndent: 150,
                        indent: 150,
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
                                  Align(
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
                                              color: Color(
                                                0xff747474,
                                              ),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                          suffixIcon: Icon(
                                            Icons.email_outlined,
                                            color: Color(0xff747474),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Mobile Number",
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
                                        controller: passController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Mobile Number',
                                          hintStyle: TextStyle(
                                              color: Color(0xff747474),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                          suffixIcon: Icon(
                                            Icons.mobile_screen_share,
                                            color: Color(0xff747474),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                          "OTP",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: authscreenTextcolor),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextFormField(
                                        controller: passController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter OTP',
                                          hintStyle: TextStyle(
                                              color: Color(0xff747474),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                          suffixIcon: Icon(
                                            Icons.lock_outlined,
                                            color: Color(0xff747474),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text(
                                    "SUBMIT",
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
