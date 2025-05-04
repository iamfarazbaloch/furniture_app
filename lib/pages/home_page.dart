import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/search.png'),
                  Column(
                    children: [
                      Text(
                        'Make home',
                        style: TextStyle(
                          color: smallText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'BEAUTIFUL',
                        style: TextStyle(
                          color: bigText,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/icons/cart.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
