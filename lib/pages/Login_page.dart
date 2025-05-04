import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';
import 'package:furniture_app/widgets/my_button.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset('assets/icons/sofa.png'),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
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
              margin: const EdgeInsets.only(right: 30, top: 20),
              padding: const EdgeInsets.only(left: 30, top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 8,
                    blurRadius: 7,
                    offset: Offset(8, -2),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 8,
                    blurRadius: 7,
                    offset: Offset(4, 12),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: TextStyle(color: mediumText)),
                  MyTextField(),
                  Gap(40),
                  Text('Password', style: TextStyle(color: mediumText)),
                  MyTextField(),
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
                    child: MyButton(text: 'Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
