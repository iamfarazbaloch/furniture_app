import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/search.png'),
          onPressed: () {},
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 34.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brandon Sanders',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'exaple123@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(20),
            _card('My Orders', 'Already have 10 orders'),
            Gap(20),
            _card('Shipping Address', '03 Address'),
            Gap(20),
            _card('Payment Method', 'You have 2 cards'),
            Gap(20),
            _card('My Reviews', 'Reviews for 5 items'),
            Gap(20),
            _card('Settings', 'Notification, Password, FAQ, Contact'),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String subtitle) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        minVerticalPadding: 20,
        title: Text(title, style: TextStyle(color: Colors.black, fontSize: 20)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
