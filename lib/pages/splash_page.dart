import 'package:flutter/material.dart';

import '../contant/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 40,
            child: Text(
              'MAKE YOUR',
              style: TextStyle(
                fontSize: 26,
                color: mediumText,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 40,
            child: Text(
              'HOME BEAUTIFUL',
              style: TextStyle(
                fontSize: 32,
                color: bigText,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                wordSpacing: 2,
              ),
            ),
          ),
          Positioned(
            top: 410,
            left: 60,
            right: 45,
            child: Text(
              'The best simple place where you discover most wonderful furniture and make your home beautiful',
              style: TextStyle(
                fontSize: 14,
                color: smallText,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                wordSpacing: 2,
                height: 2.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
