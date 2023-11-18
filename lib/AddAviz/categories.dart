import 'package:ecommerce/AddAviz/get_location.dart';
import 'package:ecommerce/AddAviz/progressbar.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/add_aviz_appbar.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AddAviz extends StatefulWidget {
  const AddAviz({super.key});

  @override
  State<AddAviz> createState() => _AddAvizState();
}

class _AddAvizState extends State<AddAviz> {
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
        appBar: addAvizAppBar,
        body: SafeArea(
          child: Column(
            children: [
              AddAvizProgressbar(progress: subCategoryState ? 2 : 1),
              subCategoryState
                  ? Column(
                      children: [
                        ...subCategory.map((e) => item(e, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => GetLocation(
                                          subCategory: subCategory,
                                        )),
                              );
                            })),
                      ],
                    )
                  : Column(
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
