import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/aviz_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.onChange,
  });
  final Map<String, List<String>> categories;
  final Function(String category) onChange;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationLimiter(
          key: UniqueKey(),
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
                ...widget.categories.keys.toList().map(
                      (e) => item(
                        e,
                        () {
                          AvizData.category = e;

                          widget.onChange(e);
                        },
                      ),
                    )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget item(String text, Function ontap_) {
    return Container(
      width: 343,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: grey1),
      ),
      child: InkWell(
        onTap: () {
          ontap_();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Iconsax.arrow_left_2,
                color: red,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({
    super.key,
    required this.onChange,
  });
  final Function(String subCategory) onChange;

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  List subCategories = [];
  @override
  void initState() {
    subCategories = AvizData.categoriesList[AvizData.category] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationLimiter(
          key: UniqueKey(),
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
                ...subCategories.map(
                  (e) => item(
                    e,
                    () {
                      AvizData.subCategory = e;
                      widget.onChange(e);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget item(String text, Function ontap_) {
    return Container(
      width: 343,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: grey1),
      ),
      child: InkWell(
        onTap: () {
          ontap_();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Iconsax.arrow_left_2,
                color: red,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
