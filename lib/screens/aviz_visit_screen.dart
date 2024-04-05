import 'dart:math';
import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/sample_data.dart';
import 'package:aviz/utils/display_state.dart';
import 'package:aviz/widgets/big_aviz_item.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:aviz/widgets/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AvizVisitScreen extends StatefulWidget {
  const AvizVisitScreen({super.key});

  @override
  State<AvizVisitScreen> createState() => _AvizVisitScreenState();
}

class _AvizVisitScreenState extends State<AvizVisitScreen> {
  Random random = Random();

  DisplayType displayType = DisplayTypleList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              elevation: 2,
              forceElevated: true,
              shadowColor: grey.withOpacity(0.5),
              title: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "بازدید های اخیر",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    if (displayType is DisplayTypleList) {
                      displayType = DisplayTypleGrid();
                    } else if (displayType is DisplayTypleGrid) {
                      displayType = DisplayTypleList();
                    }
                  });
                },
                icon: Icon(
                  displayType is DisplayTypleList
                      ? Iconsax.menu_1
                      : Iconsax.menu,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Transform.scale(
                    scaleX: -1,
                    child: const Icon(
                      Iconsax.arrow_left_2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  displayType is DisplayTypleList
                      ? listDisplay()
                      : gridDisplay(),
                  const SizedBox(height: 10),
                  const AvizLogoWithText(isActive: false),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridDisplay() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: Wrap(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            ...sampleData.values
                .map(
                  (e) => VerticalCard(
                    image: e["image"] ?? "",
                    title: e["title"] ?? "",
                    subTitle: e["subTitle"] ?? "",
                    price: e["price"] ?? "",
                    date: e["date"] ?? "",
                    idDynamic: true,
                    isLiked: random.nextInt(9) % 2 == 0,
                    notification: random.nextInt(9) % 2 == 0,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget listDisplay() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            ...sampleData.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: BigAvizCard(
                      image: e["image"] ?? "",
                      type: e["type"] ?? "",
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
      ),
    );
  }
}
