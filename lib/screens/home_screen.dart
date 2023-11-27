import 'package:aviz/constants/colors.dart';
import 'package:aviz/widgets/horizontal_card.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:aviz/widgets/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Map<String, Map<String, String>> hotAviz = {
    "1": {
      "image": "assets/images/p2.png",
      "title": "واحد ۵ خواب متراژ ۲۵۰",
      "subTitle": "دکور شیک و مینیمال، موقعیت عالی، ۳ طبقه، ۳ واحد",
      "price": "۲۵٬۶۸۳٬۰۰۰٬۰۰۰",
    },
    "2": {
      "image": "assets/images/p1.png",
      "title": "ویلا ۵۰۰ متری زیر قیمت",
      "subTitle": "ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری",
      "price": "۸٬۲۰۰٬۰۰۰٬۰۰۰",
    },
  };

  final Map<String, Map<String, String>> recentlyAviz = {
    "1": {
      "image": "assets/images/p3.png",
      "title": "واحد دوبلکس فول امکانات",
      "subTitle": "سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل",
      "price": "۸٬۲۰۰٬۰۰۰٬۰۰۰",
    },
    "2": {
      "image": "assets/images/p4.png",
      "title": "پنت هاوس ۳۰۰ متری ناهارخوران",
      "subTitle": "تحویل فوری، ویو عالی به همراه امکانات فول",
      "price": "۵٬۹۰۰٬۰۰۰٬۰۰۰",
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  const SizedBox(height: 10),
                  const AvizLogoWithText(isActive: true),
                  const SizedBox(height: 20),
                  horizontalList(title: "آویز های داغ", list: hotAviz),
                  const SizedBox(height: 20),
                  verticalList(title: "آویز های اخیر", list: recentlyAviz),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget horizontalList(
      {required String title, required Map<String, Map<String, String>> list}) {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              ...list.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: VerticalCard(
                        image: e["image"] ?? "",
                        title: e["title"] ?? "",
                        subTitle: e["subTitle"] ?? "",
                        price: e["price"] ?? "",
                      ),
                    ),
                  )
                  .toList(),
              ...list.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: VerticalCard(
                        image: e["image"] ?? "",
                        title: e["title"] ?? "",
                        subTitle: e["subTitle"] ?? "",
                        price: e["price"] ?? "",
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget verticalList(
      {required String title, required Map<String, Map<String, String>> list}) {
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
        Column(
          children: [
            ...list.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: HorizontalCard(
                      image: e["image"] ?? "",
                      title: e["title"] ?? "",
                      subTitle: e["subTitle"] ?? "",
                      price: e["price"] ?? "",
                    ),
                  ),
                )
                .toList(),
            ...list.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: HorizontalCard(
                      image: e["image"] ?? "",
                      title: e["title"] ?? "",
                      subTitle: e["subTitle"] ?? "",
                      price: e["price"] ?? "",
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
