import 'package:flutter/material.dart';
import 'package:medical_app/authantication/loginScreen.dart';
import 'package:medical_app/constants/colors_const.dart';
import 'package:medical_app/constants/image_const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
                          borderRadius: BorderRadius.only(
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
                                              controller: emailController,
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
                                                  return 'Please enter your email';
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
                                              controller: passController,
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
                                              controller: passController,
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
                                                "Name",
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
                                                hintText: 'Eenter Your Name',
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
                                  GestureDetector(
                                    onTap: () {},
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
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
