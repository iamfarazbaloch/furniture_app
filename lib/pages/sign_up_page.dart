import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';
import 'package:furniture_app/widgets/my_button.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20,
                  ),
                  child: Text(
                    'WELCOME ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: bigText,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Container(
                  height: 600,
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
                      Text('Name', style: TextStyle(color: mediumText)),
                      MyTextField(
                        controller: nameController,
                        obscureText: false,
                      ),
                      Gap(30),
                      Text('Email', style: TextStyle(color: mediumText)),
                      MyTextField(
                        controller: emailController,
                        obscureText: false,
                      ),
                      Gap(30),
                      Text('Password', style: TextStyle(color: mediumText)),
                      MyTextField(
                        controller: passwordController,
                        obscureText: true,
                      ),
                      Gap(30),
                      Text(
                        'Confirm Password',
                        style: TextStyle(color: mediumText),
                      ),
                      MyTextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                      Gap(40),
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: MyButton(text: 'Sign Up'),
                      ),
                      Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              ' Login',
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
