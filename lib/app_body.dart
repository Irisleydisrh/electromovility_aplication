import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'pages/home_page.dart';
import 'pages/likes_page.dart';
import 'pages/settings_page.dart';
import 'pages/statistics/statistics_page.dart';
import 'pages/user_page.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomePage(),
      const UserPage(),
      const LikesPage(),
      const SettingsPage()
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(53, 184, 134, 1),
        ),
        title: const Text(
          'Phase Mobil',
          style: TextStyle(color: Color.fromRGBO(53, 184, 134, 1)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                child: Text(
              'Drawer Header',
            )),
            ListTile(
              title: const Text(
                'statistics',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StadisticPage(),
                  ),
                );

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.grey.shade100,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(53, 184, 134, 1),
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: ((value) {
              setState(() {
                selectedIndex = value;
              });
            }),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                iconColor: Color.fromRGBO(53, 184, 134, 1),
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'User',
                iconColor: Color.fromRGBO(53, 184, 134, 1),
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
                iconColor: Color.fromRGBO(53, 184, 134, 1),
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                iconColor: Color.fromRGBO(53, 184, 134, 1),
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
