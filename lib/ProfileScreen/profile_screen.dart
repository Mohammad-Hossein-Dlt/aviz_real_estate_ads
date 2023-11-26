import 'package:aviz/Constants/colors.dart';
import 'package:aviz/GeneralWidgets/custom_title.dart';
import 'package:aviz/GeneralWidgets/logo_with_text.dart';
import 'package:aviz/iconsax_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const AvizLogoWithText(isActive: true),
              const SizedBox(height: 10),
              search(),
              const SizedBox(height: 20),
              const CustomTitle(
                text: "حساب کاربری",
                icon: Icon(
                  Iconsax.profile_2user,
                  color: red,
                  size: 24,
                ),
              ),
              const SizedBox(height: 10),
              info(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(color: grey2),
              ),
              const Column(
                children: [
                  ProfileItem(
                    text: "آگهی های من",
                    icon: Icon(
                      Iconsax.note_2,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "پرداخت های من",
                    icon: Icon(
                      Iconsax.card,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "بازدید های اخیر",
                    icon: Icon(
                      Iconsax.eye,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "ذخیره شده ها",
                    icon: Icon(
                      Iconsax.save_2,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "تنظیمات",
                    icon: Icon(
                      Iconsax.setting,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "پشتیبانی و قوانین",
                    icon: Icon(
                      Iconsax.message_question,
                      color: red,
                      size: 24,
                    ),
                  ),
                  ProfileItem(
                    text: "درباره آویز",
                    icon: Icon(
                      Iconsax.info_circle,
                      color: red,
                      size: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "نسخه\n۱.۵.۹",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: grey3),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 343,
          // height: 48,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey, width: 2),
          ),
          child: const Center(
            child: TextField(
              autofocus: false,
              textDirection: TextDirection.rtl,
              maxLines: 1,
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintTextDirection: TextDirection.rtl,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintText: "جستجو...",
                hintStyle: TextStyle(
                  color: grey3,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                suffixIcon: Icon(
                  Iconsax.search_normal,
                  color: grey3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget info() {
    return Container(
      width: 343,
      height: 95,
      decoration: BoxDecoration(
        border: Border.all(
          color: grey2,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Iconsax.edit,
                        color: red,
                        size: 24,
                      ),
                      Text("سید محمد جواد هاشمی"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          minimumSize: const Size(66, 32),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text("تایید شده"),
                      ),
                      const SizedBox(width: 10),
                      const Text("۰۹۱۱۷۵۴۰۱۴۵"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Image.asset("assets/images/profile.png"),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 343,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey),
          ),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Iconsax.arrow_left_2,
                    color: grey3,
                    size: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      icon,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
