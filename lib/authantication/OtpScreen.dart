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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  logoImg,
                  scale: 7,
                ),
              ),
              Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: baseColor,
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
                        "Forget Password",
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email ID/Username",
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
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
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
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: passController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
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
                                horizontal: 16.0, vertical: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: passController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
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
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 40.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: authButtoncolor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "SUBMIT",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
