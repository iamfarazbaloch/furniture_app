import 'package:flutter/material.dart';

import 'favorite_page.dart';
import 'home_page.dart';
import 'notification_page.dart';
import 'profile_page.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2
                  ? Icons.notifications
                  : Icons.notifications_none,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 3 ? Icons.person : Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
