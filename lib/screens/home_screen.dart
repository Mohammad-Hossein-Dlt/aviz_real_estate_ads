import 'dart:math';

import 'package:aviz/constants/colors.dart';
import 'package:aviz/sample_data.dart';
import 'package:aviz/screens/aviz_list_screen.dart';
import 'package:aviz/widgets/horizontal_card.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:aviz/widgets/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Random random = Random();

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
                  horizontalList(title: "آویز های داغ"),
                  const SizedBox(height: 20),
                  verticalList(title: "آویز های اخیر"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget horizontalList({
    required String title,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AvizListScreen(
                        title: title,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "مشاهده همه",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14, color: grey3),
                ),
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
              ...sampleData.values
                  .toList()
                  .sublist(4)
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: VerticalCard(
                        image: e["image"] ?? "",
                        title: e["title"] ?? "",
                        subTitle: e["subTitle"] ?? "",
                        price: e["price"] ?? "",
                        date: e["date"] ?? "",
                        isLiked: random.nextInt(9) % 2 == 0,
                        notification: random.nextInt(9) % 2 == 0,
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

  Widget verticalList({
    required String title,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AvizListScreen(
                        title: title,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "مشاهده همه",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14, color: grey3),
                ),
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
            ...sampleData.values
                .toList()
                .sublist(4, 8)
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: HorizontalCard(
                      image: e["image"] ?? "",
                      title: e["title"] ?? "",
                      subTitle: e["subTitle"] ?? "",
                      price: e["price"] ?? "",
                      date: e["date"] ?? "",
                      isLiked: random.nextInt(9) % 2 == 0,
                      notification: random.nextInt(9) % 2 == 0,
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
