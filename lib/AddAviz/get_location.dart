import 'package:aviz/AddAviz/aviz_possibilities.dart';
import 'package:aviz/AddAviz/progressbar.dart';
import 'package:aviz/Constants/colors.dart';
import 'package:aviz/GeneralWidgets/add_aviz_appbar.dart';
import 'package:aviz/GeneralWidgets/custom_switch_button.dart';
import 'package:aviz/GeneralWidgets/custom_title.dart';
import 'package:aviz/GeneralWidgets/map.dart';
import 'package:aviz/iconsax_icons.dart';
import 'package:flutter/material.dart';

class GetLocationScreen extends StatelessWidget {
  GetLocationScreen({super.key, required this.subCategory});
  final List<String> subCategory;

  bool showLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Navigator.of(context).pop();
        },
        exitButton: null,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddAvizProgressbar(progress: 0.6),
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
                        CustomMapWidget(locationName: "گرگان، صیاد شیرازی"),
                        const SizedBox(height: 20),
                        CustomSwitchButton(
                          title: "موقعیت دقیق نقشه نمایش داده شود؟",
                          active: showLocation,
                          onPressed: (isActive) {
                            showLocation = isActive;
                          },
                        ),
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
                                  builder: (context) => AvizPossibilitiesScreen(
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
