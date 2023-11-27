import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/profile_screen.dart';
import 'package:aviz/screens/search_screen.dart';
import 'package:aviz/widgets/logo.dart';

import 'package:flutter/material.dart';

import 'addAviz/categories_screen.dart';
import 'home_screen.dart';

class MainScreenNavigationBar extends StatefulWidget {
  MainScreenNavigationBar({super.key});

  @override
  State<MainScreenNavigationBar> createState() =>
      _MainScreenNavigationBarState();
}

class _MainScreenNavigationBarState extends State<MainScreenNavigationBar> {
  int curentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: grey,
        currentIndex: curentIndex,
        elevation: 0,
        onTap: (index) {
          setState(() {
            curentIndex = index;
          });
        },
        selectedFontSize: 12,
        selectedItemColor: red,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 12,
        unselectedItemColor: grey3,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.profile_circle,
                color: grey3,
              ),
              activeIcon: Icon(
                Iconsax.profile_circle,
                color: red,
              ),
              label: "آویز من"),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.add_circle,
                color: grey3,
              ),
              activeIcon: Icon(
                Iconsax.add_circle,
                color: red,
              ),
              label: "افزودن آویز"),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.search_normal,
                color: grey3,
              ),
              activeIcon: Icon(
                Iconsax.search_normal,
                color: red,
              ),
              label: "جستجو"),
          BottomNavigationBarItem(
              icon: AvizLogo(isActive: false),
              activeIcon: AvizLogo(isActive: true),
              label: "آویز آگهی ها"),
        ],
      ),
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          IndexedStack(
            index: curentIndex,
            children: [
              const ProfileScreen(),
              const CategoriesScreen(),
              const SearchScreen(),
              HomeScreen(),
            ],
          ),
        ]),
      ),
    );
  }
}
