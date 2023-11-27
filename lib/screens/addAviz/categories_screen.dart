import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/progressbar.dart';
import 'package:aviz/widgets/add_aviz_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'get_location_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool subCategoryState = false;
  List<String> subCategory = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!subCategoryState) {
          Navigator.of(context).pop();
        } else {
          setState(() {
            subCategoryState = false;
          });
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: addAvizAppBar(
          ctx: context,
          title: const Text(
            "دسته بندی آویز",
            style: TextStyle(
              color: red,
            ),
          ),
          backButton: () {
            setState(() {
              subCategoryState = false;
            });
          },
          exitButton: null,
        ),
        body: SafeArea(
          child: Column(
            children: [
              AddAvizProgressbar(progress: subCategoryState ? 0.4 : 0.2),
              if (subCategoryState)
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
                        ...subCategory.map((e) => item(e, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => GetLocationScreen(
                                          subCategory: subCategory,
                                        )),
                              );
                            })),
                      ],
                    ),
                  ),
                )
              else
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
                        item("اجاره مسکونی", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                            subCategory = [
                              "فروش آپارتمان",
                              "فروش خانه و ویلا",
                              "فروش زمین و کلنگی",
                            ];
                          });
                        }),
                        item("فروش مسکونی", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("فروش دفاتر اداری و تجاری", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("اجاره دفاتر اداری و تجاری", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("اجاره کوتاه مدت", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("پروژه های ساخت و ساز", () {
                          subCategory = [];

                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String text, Function ontap_) {
    return Container(
      width: 343,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: grey),
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
