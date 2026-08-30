import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home/home_screen.dart';
import 'package:flutter_app/screen/post/post_list_screen.dart';
import 'package:flutter_app/screen/post/post_create_screen.dart';
import 'package:flutter_app/screen/setting/setting_screen.dart';
import 'package:flutter_app/screen/user/user_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          PostListScreen(),
          UserScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: NavigationBar(
          indicatorShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          backgroundColor: const Color(0xFFF3F2F2),
          selectedIndex: currentIndex,
          indicatorColor: Colors.green,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'NotoSansKhmer',
              );
            }

            return const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'NotoSansKhmer',
            );
          }),
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.blueGrey),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.article_outlined, color: Colors.blueGrey),
              selectedIcon: Icon(Icons.article, color: Colors.white),
              label: 'Post'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined, color: Colors.blueGrey),
              selectedIcon: Icon(Icons.person, color: Colors.white),
              label: 'User'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined, color: Colors.blueGrey),
              selectedIcon: Icon(Icons.settings, color: Colors.white),
              label: 'Setting'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
