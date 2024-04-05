import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/aviz_data.dart';
import 'package:aviz/widgets/custom_switch_button.dart';
import 'package:aviz/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class PossibilitiesScreen extends StatefulWidget {
  const PossibilitiesScreen({
    super.key,
    required this.onChange,
  });
  final Function() onChange;
  @override
  State<PossibilitiesScreen> createState() => _PossibilitiesScreenState();
}

class _PossibilitiesScreenState extends State<PossibilitiesScreen> {
  List subCategories = [];

  // TextEditingController rooms = TextEditingController();
  // TextEditingController floor = TextEditingController();
  // TextEditingController metrage = TextEditingController();
  // TextEditingController yearOfConstruction = TextEditingController();

  // bool elevator = true;
  // bool parking = false;
  // bool warehouse = true;
  @override
  void initState() {
    super.initState();
    subCategories = AvizData.categoriesList[AvizData.category] ?? [];
    // category = widget.subCategories.isNotEmpty
    //     ? widget.subCategories.contains(widget.selectedSubCategory)
    //         ? widget.selectedSubCategory
    //         : widget.subCategories.first
    //     : "";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            color: grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.arrow_down_1,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              DropdownButton(
                                value: AvizData.subCategory,
                                elevation: 0,
                                underline: const SizedBox(),
                                icon: const SizedBox(),
                                items: subCategories
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: SizedBox(
                                          width: 116,
                                          child: Text(
                                            e,
                                            overflow: TextOverflow.ellipsis,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        )))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    AvizData.subCategory = value.toString();
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
              const Divider(),
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
                    AvizData.numberOfRooms,
                    grey3,
                  ),
                  attributesItem(
                    "متراژ",
                    "۳۵۰",
                    AvizData.metrage,
                    Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  attributesItem(
                    "طبقه",
                    "۳",
                    AvizData.floor,
                    Colors.black,
                  ),
                  attributesItem(
                    "سال ساخت",
                    "۱۴۰۲",
                    AvizData.yearOfConstruction,
                    Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
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
                    active: AvizData.elevator,
                    onPressed: (isActive) {
                      AvizData.elevator = isActive;
                    },
                  ),
                  CustomSwitchButton(
                    title: "پارکینگ",
                    active: AvizData.parking,
                    onPressed: (isActive) {
                      AvizData.parking = isActive;
                    },
                  ),
                  CustomSwitchButton(
                    title: "انباری",
                    active: AvizData.warehouse,
                    onPressed: (isActive) {
                      AvizData.warehouse = isActive;
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
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => const GetInformationScreen()),
                  // );
                  widget.onChange();
                },
                child: const Text("بعدی"),
              ),
              const SizedBox(height: 20),
            ],
          ),
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
