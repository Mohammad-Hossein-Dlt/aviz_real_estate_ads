import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/horizontal_card.dart';
import 'package:ecommerce/GeneralWidgets/logo_with_text.dart';
import 'package:ecommerce/GeneralWidgets/vertical_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          const AvizLogoWithText(isActive: true),
          const SizedBox(height: 20),
          horizontalList("آویز های داغ"),
          const SizedBox(height: 20),
          verticalList("آویز های اخیر"),
        ],
      )),
    );
  }

  Widget horizontalList(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "مشاهده همه",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: grey3),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              VerticalCard(
                image: "assets/images/p2.png",
                title: "واحد ۵ خواب متراژ ۲۵۰",
                subTitle: "دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد",
                price: "۲۵٬۶۸۳٬۰۰۰٬۰۰۰",
              ),
              SizedBox(width: 20),
              VerticalCard(
                image: "assets/images/p1.png",
                title: "ویلا ۵۰۰ متری زیر قیمت",
                subTitle: "ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری",
                price: "۸٬۲۰۰٬۰۰۰٬۰۰۰",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget verticalList(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "مشاهده همه",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: grey3),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Column(
          children: [
            HorizontalCard(
              image: "assets/images/p3.png",
              title: "واحد دوبلکس فول امکانات",
              subTitle: "سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل",
              price: "۸٬۲۰۰٬۰۰۰٬۰۰۰",
            ),
            SizedBox(height: 20),
            HorizontalCard(
              image: "assets/images/p4.png",
              title: "پنت هاوس ۳۰۰ متری ناهارخوران",
              subTitle: "تحویل فوری، ویو عالی به همراه امکانات فول",
              price: "۵٬۹۰۰٬۰۰۰٬۰۰۰",
            ),
          ],
        ),
      ],
    );
  }
}
