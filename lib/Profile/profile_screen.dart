import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/custom_title.dart';
import 'package:ecommerce/GeneralWidgets/logo.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            header(),
            const SizedBox(height: 20),
            CustomTitle(
              text: "حساب کاربری",
              icon: const Icon(
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
              child: Divider(),
            ),
            Column(
              children: [
                ProfileItem(
                  text: "آگهی های من",
                  icon: const Icon(
                    Iconsax.note_2,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "پرداخت های من",
                  icon: const Icon(
                    Iconsax.card,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "بازدید های اخیر",
                  icon: const Icon(
                    Iconsax.eye,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "ذخیره شده ها",
                  icon: const Icon(
                    Iconsax.save_2,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "تنظیمات",
                  icon: const Icon(
                    Iconsax.setting,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "پشتیبانی و قوانین",
                  icon: const Icon(
                    Iconsax.message_question,
                    color: red,
                    size: 24,
                  ),
                ),
                ProfileItem(
                  text: "درباره آویز",
                  icon: const Icon(
                    Iconsax.info_circle,
                    color: red,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "آویزمن",
          style:
              TextStyle(color: red, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(width: 4),
        AvizLogo(),
      ],
    );
  }

  Widget info() {
    return Container(
      width: 343,
      height: 95,
      decoration: BoxDecoration(
        border: Border.all(
          color: grey,
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
  ProfileItem({super.key, required this.text, required this.icon});
  String text;
  Icon icon;
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
      ],
    );
  }
}
