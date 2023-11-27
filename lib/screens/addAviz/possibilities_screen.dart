import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/get_information_screen.dart';
import 'package:aviz/screens/addAviz/progressbar.dart';
import 'package:aviz/widgets/add_aviz_appbar.dart';
import 'package:aviz/widgets/custom_switch_button.dart';
import 'package:aviz/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class PossibilitiesScreen extends StatefulWidget {
  const PossibilitiesScreen({super.key, required this.subCategory});
  final List<String> subCategory;
  @override
  State<PossibilitiesScreen> createState() => _PossibilitiesScreenState();
}

class _PossibilitiesScreenState extends State<PossibilitiesScreen> {
  String category = "";

  TextEditingController rooms = TextEditingController();
  TextEditingController floor = TextEditingController();
  TextEditingController metrage = TextEditingController();
  TextEditingController yearOfConstruction = TextEditingController();

  bool elevator = true;
  bool parking = false;
  bool warehouse = true;
  @override
  void initState() {
    super.initState();
    category = widget.subCategory.first;
  }

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
                AddAvizProgressbar(progress: 0.8),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CustomTitle(
                        text: "انتخاب دسته بندی آویز",
                        icon: Icon(
                          Iconsax.category,
                          color: red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 160,
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "محدوده ملک",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: grey3,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    color: grey,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "خیابان صیاد شیرازی",
                                      style: TextStyle(color: grey3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "دسته بندی",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: grey3,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 160,
                                  height: 48,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2)),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Iconsax.arrow_down_1,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 10),
                                      DropdownButton(
                                        value: category,
                                        elevation: 0,
                                        underline: const SizedBox(),
                                        icon: const SizedBox(),
                                        items: widget.subCategory
                                            .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: SizedBox(
                                                  width: 116,
                                                  child: Text(
                                                    e,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            category = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomTitle(
                        text: "ویژگی ها",
                        icon: Icon(
                          Iconsax.clipboard,
                          color: red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          attributesItem(
                            "تعداد اتاق",
                            "۶",
                            rooms,
                            grey3,
                          ),
                          attributesItem("متراژ", "۳۵۰", metrage, Colors.black),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          attributesItem("طبقه", "۳", floor, Colors.black),
                          attributesItem("سال ساخت", "۱۴۰۲", yearOfConstruction,
                              Colors.black),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomTitle(
                        text: "امکانات",
                        icon: Icon(
                          Iconsax.magicpen,
                          color: red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          CustomSwitchButton(
                            title: "آسانسور",
                            active: elevator,
                            onPressed: (isActive) {
                              elevator = isActive;
                            },
                          ),
                          CustomSwitchButton(
                            title: "پارکینگ",
                            active: parking,
                            onPressed: (isActive) {
                              parking = isActive;
                            },
                          ),
                          CustomSwitchButton(
                            title: "انباری",
                            active: warehouse,
                            onPressed: (isActive) {
                              warehouse = isActive;
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          minimumSize: const Size(320, 40),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GetInformationScreen()),
                          );
                        },
                        child: const Text("بعدی"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget attributesItem(String title_, String default_,
      TextEditingController controller_, Color color) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title_,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: grey3,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  border: Border.all(color: grey, width: 4),
                  color: grey,
                ),
                child: TextField(
                  controller: controller_,
                  autofocus: false,
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: default_,
                    hintStyle: const TextStyle(
                      color: grey3,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    prefixIcon: Column(
                      children: [
                        Transform.scale(
                          scaleY: -1,
                          child: const Icon(
                            Iconsax.arrow_down5,
                            color: red,
                            size: 20,
                          ),
                        ),
                        const Icon(
                          Iconsax.arrow_down5,
                          color: red,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
