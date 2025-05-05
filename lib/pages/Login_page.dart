import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';
import 'package:furniture_app/pages/app_main_screen.dart';
import 'package:furniture_app/widgets/my_button.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
import 'package:gap/gap.dart';

import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset('assets/icons/sofa.png'),
                      ),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Hello !',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: smallText,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'WELCOME BACK',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: bigText,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 30, top: 30),
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 6,
                        blurRadius: 12,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email', style: TextStyle(color: mediumText)),
                      MyTextField(
                        controller: emailController,
                        obscureText: false,
                      ),
                      Gap(40),
                      Text('Password', style: TextStyle(color: mediumText)),
                      MyTextField(
                        controller: passwordController,
                        obscureText: true,
                      ),
                      Gap(40),
                      Center(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      Gap(40),
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: MyButton(
                          text: 'Login',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppMainScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
