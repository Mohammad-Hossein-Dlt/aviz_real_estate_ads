import 'package:ecommerce/AddAviz/aviz_possibilities.dart';
import 'package:ecommerce/AddAviz/progressbar.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/custom_title.dart';
import 'package:ecommerce/GeneralWidgets/map.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key, required this.subCategory});
  final List<String> subCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: addAvizAppBar,
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddAvizProgressbar(progress: 3),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        const CustomTitle(
                          text: "موقعیت مکانی",
                          icon: Icon(
                            Iconsax.map,
                            color: red,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.",
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 20),
                        const CustomMapWidget(),
                        const SizedBox(height: 20),
                        CustomSwitchButton(
                            title: "موقعیت دقیق نقشه نمایش داده شود؟",
                            active: true),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: red,
                            minimumSize: const Size(320, 40),
                          ),
                          onPressed: () {
                            // print(subCategory);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AvizPossibilities(
                                        subCategory: subCategory,
                                      )),
                            );
                          },
                          child: const Text("بعدی"),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
