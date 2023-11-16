import 'package:ecommerce/AddAviz/categories.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo.dart';
import 'package:ecommerce/Home/home_screen.dart';
import 'package:ecommerce/Profile/profile_screen.dart';
import 'package:ecommerce/Search/search_screen.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Iconsax.profile_circle,
                color: grey3,
              ),
              activeIcon: Icon(
                Iconsax.profile_circle,
                color: red,
              ),
              label: "آویز من"),
          const BottomNavigationBarItem(
              icon: Icon(
                Iconsax.add_circle,
                color: grey3,
              ),
              activeIcon: Icon(
                Iconsax.add_circle,
                color: red,
              ),
              label: "افزودن آویز"),
          const BottomNavigationBarItem(
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
              const Profile(),
              const AddAviz(),
              const SearchScreen(),
              const HomeScreen(),
            ],
          ),
        ]),
      ),
    );
  }
}
