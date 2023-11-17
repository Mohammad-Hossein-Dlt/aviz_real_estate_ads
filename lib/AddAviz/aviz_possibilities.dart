import 'package:ecommerce/AddAviz/categories.dart';
import 'package:ecommerce/AddAviz/get_information.dart';
import 'package:ecommerce/AddAviz/progressbar.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/custom_title.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AvizPossibilities extends StatefulWidget {
  const AvizPossibilities({super.key, required this.subCategory});
  final List<String> subCategory;
  @override
  State<AvizPossibilities> createState() => _AvizPossibilitiesState();
}

class _AvizPossibilitiesState extends State<AvizPossibilities> {
  String category = "";
  @override
  void initState() {
    super.initState();
    category = widget.subCategory.first;
  }

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
                AddAvizProgressbar(progress: 4),
              ],
            ),
            Expanded(
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
                        attributesItem("تعداد اتاق", "۶", grey3),
                        attributesItem("متراژ", "۳۵۰", Colors.black),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        attributesItem("طبقه", "۳", Colors.black),
                        attributesItem("سال ساخت", "۱۴۰۲", Colors.black),
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
                        CustomSwitchButton(title: "آسانسور", active: true),
                        CustomSwitchButton(title: "پارکینگ", active: false),
                        CustomSwitchButton(title: "انباری", active: true),
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
                              builder: (context) => const GetInformation()),
                        );
                      },
                      child: const Text("بعدی"),
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

  Widget attributesItem(String title_, String default_, Color color) {
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
          const SizedBox(height: 10),
          Container(
            width: 160,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              color: grey,
              borderRadius: const BorderRadius.all(Radius.circular(2)),
            ),
            child: Row(
              children: [
                Column(
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
                const SizedBox(width: 10),
                DropdownButton(
                  elevation: 0,
                  underline: const SizedBox(),
                  icon: const SizedBox(),
                  alignment: Alignment.centerRight,
                  items: [
                    DropdownMenuItem(
                        child: SizedBox(
                      width: 100,
                      child: Text(
                        default_,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: color),
                      ),
                    )),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitchButton extends StatefulWidget {
  CustomSwitchButton({super.key, required this.title, required this.active});
  final String title;
  bool active;
  @override
  State<CustomSwitchButton> createState() => CustomSwitchButtonState();
}

class CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(40, 48),
              maximumSize: const Size(40, 48),
            ),
            onPressed: () {
              setState(() {
                widget.active = !widget.active;
              });
            },
            child: Icon(
              widget.active
                  ? Iconsax.toggle_on_circle5
                  : Iconsax.toggle_off_circle,
              color: widget.active ? red : grey3,
              size: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
