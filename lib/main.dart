import 'package:flutter/material.dart';
import 'package:furniture_app/pages/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'provider/cart_provider.dart';
import 'provider/favorite_provider.dart';
import 'provider/furniture_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FurnitureProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.gelasioTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashPage(),
    );
  }
}
