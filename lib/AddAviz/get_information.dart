import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/AddAviz/progressbar.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/add_aviz_appbar.dart';
import 'package:ecommerce/GeneralWidgets/custom_switch_button.dart';
import 'package:ecommerce/GeneralWidgets/custom_title.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class GetInformationScreen extends StatelessWidget {
  const GetInformationScreen({super.key});

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
                AddAvizProgressbar(progress: 5),
              ],
            ),
            Expanded(
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
                          const SizedBox(height: 10),
                          DottedBorder(
                            color: grey3,
                            radius: const Radius.circular(2),
                            dashPattern: const [4, 6],
                            strokeWidth: 1.5,
                            child: SizedBox(
                              width: 343,
                              height: 160,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "لطفا تصویر آویز خود را بارگذاری کنید",
                                    style: TextStyle(
                                      color: grey3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 149,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: const BoxDecoration(
                                        color: red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: const Row(
                                      children: [
                                        Text(
                                          "انتخاب تصویر",
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Iconsax.document_upload,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                          const SizedBox(height: 10),
                          Container(
                            width: 343,
                            // height: 48,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                              border: Border.all(color: grey, width: 4),
                              color: grey,
                            ),
                            child: const Center(
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                minLines: 1,
                                decoration: InputDecoration(
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
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
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
                          const SizedBox(height: 10),
                          Container(
                            width: 343,
                            // height: 48,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                              border: Border.all(color: grey, width: 4),
                              color: grey,
                            ),
                            child: const Center(
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                maxLines: 5,
                                minLines: 5,
                                decoration: InputDecoration(
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
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                          CustomSwitchButton(
                              title: "فعال کردن گفتگو", active: false),
                          CustomSwitchButton(
                              title: "فعال کردن تماس", active: true),
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
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (context) => GetLocation()),
                              // );
                            },
                            child: const Text("ثبت آگهی"),
                          ),
                          const SizedBox(height: 10),
                        ],
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
}
