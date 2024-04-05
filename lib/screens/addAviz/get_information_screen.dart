import 'dart:io';
import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/constants/app_data_directory.dart';
import 'package:aviz/screens/addAviz/aviz_data.dart';
import 'package:aviz/widgets/custom_switch_button.dart';
import 'package:aviz/widgets/custom_title.dart';
import 'package:flutter/material.dart';

import '../../widgets/aviz_image.dart';

class GetInformationScreen extends StatefulWidget {
  const GetInformationScreen({super.key, required this.onChange});
  final Function() onChange;

  @override
  State<GetInformationScreen> createState() => _GetInformationScreenState();
}

class _GetInformationScreenState extends State<GetInformationScreen> {
  String imageName = "";

  @override
  void initState() {
    List flist = AppDataDirectory.cache().listSync();
    for (File f in flist) {
      f.delete();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const CustomTitle(
                    text: "تصویر آویز",
                    icon: Icon(
                      Iconsax.camera,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ImageItem(
                    onChanged: (name) {
                      imageName = name;
                    },
                  ),
                  const SizedBox(height: 20),
                  const CustomTitle(
                    text: "عنوان آویز",
                    icon: Icon(
                      Iconsax.edit_2,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 343,
                    // height: 48,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border: Border.all(color: grey, width: 4),
                      color: grey,
                    ),
                    child: Center(
                      child: TextField(
                        controller: AvizData.title,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        minLines: 1,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "عنوان آویز را وارد کنید",
                          hintStyle: TextStyle(
                            color: grey3,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomTitle(
                    text: "توضیحات",
                    icon: Icon(
                      Iconsax.clipboard_text,
                      color: red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 343,
                    // height: 48,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      border: Border.all(color: grey, width: 4),
                      color: grey,
                    ),
                    child: Center(
                      child: TextField(
                        controller: AvizData.description,
                        textDirection: TextDirection.rtl,
                        maxLines: 5,
                        minLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "توضیحات آویز را وارد کنید ...",
                          hintStyle: TextStyle(
                            color: grey3,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  CustomSwitchButton(
                    title: "فعال کردن گفتگو",
                    active: AvizData.chat,
                    onPressed: (isActive) {
                      AvizData.chat = isActive;
                    },
                  ),
                  CustomSwitchButton(
                    title: "فعال کردن تماس",
                    active: AvizData.call,
                    onPressed: (isActive) {
                      AvizData.call = isActive;
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
                    onPressed: () {},
                    child: const Text("ثبت آگهی"),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
