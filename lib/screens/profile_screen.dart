import 'package:aviz/constants/colors.dart';
import 'package:aviz/widgets/custom_title.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';

import '../constants/iconsax_icons.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Map<String, String> userData = {
    "name":  "محمد حسین دولت آبادی",
    "phone-number": "09123456789",
  };

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
                child: Divider(color: grey),
              ),
              Column(
                children: [
                  profileItem(
                    text: "آگهی های من",
                    icon: const Icon(
                      Iconsax.note_2,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "پرداخت های من",
                    icon: const Icon(
                      Iconsax.card,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "بازدید های اخیر",
                    icon: const Icon(
                      Iconsax.eye,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "ذخیره شده ها",
                    icon: const Icon(
                      Iconsax.save_2,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "تنظیمات",
                    icon: const Icon(
                      Iconsax.setting,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "پشتیبانی و قوانین",
                    icon: const Icon(
                      Iconsax.message_question,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  profileItem(
                    text: "درباره آویز",
                    icon: const Icon(
                      Iconsax.info_circle,
                      color: red,
                      size: 24,
                    ),
                    onTap_: () {},
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "نسخه\n۱.۵.۹",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: grey3),
                  ),
                  const SizedBox(height: 20),
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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey1, width: 2),
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
          color: grey1,
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
                  SizedBox(
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.edit,
                            color: red,
                            size: 24,
                          ),
                        ),
                        Text(userData["name"] ?? ""),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: red,
                            minimumSize: const Size(66, 26),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "تایید شده",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        // Text("تایید شده"),
                        const SizedBox(width: 10),
                        Text(userData["phone-number"] ?? ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              width: 56,
              height: 56,
              child: Image.asset("assets/images/profile.png", scale: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileItem(
      {required String text, required Icon icon, required Function onTap_}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 343,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey1),
          ),
          child: InkWell(
            onTap: () {
              onTap_();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Iconsax.arrow_left_2,
                    color: grey3,
                    size: 24,
                  ),
                  CustomTitle(text: text, icon: icon),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
