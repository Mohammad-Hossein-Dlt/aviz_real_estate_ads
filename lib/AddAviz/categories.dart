import 'package:ecommerce/AddAviz/aviz_possibilities.dart';
import 'package:ecommerce/AddAviz/progressbar.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

AppBar addAvizAppBar = AppBar(
  backgroundColor: Colors.white,
  centerTitle: true,
  elevation: 0,
  leading: TextButton(
    onPressed: () {},
    child: const Icon(
      Icons.close,
      color: Colors.black,
    ),
  ),
  actions: [
    TextButton(
      onPressed: () {},
      child: Transform.scale(
        scaleX: -1,
        child: const Icon(
          Iconsax.arrow_left_2,
          color: Colors.black,
        ),
      ),
    ),
  ],
  title: const Text("دسته بندی آویز",
      style: TextStyle(
        color: red,
      )),
);

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
                                    builder: (context) => AvizPossibilities()),
                              );
                            })),
                      ],
                    )
                  : Column(
                      children: [
                        item("اجاره مسکونی", () {
                          setState(() {
                            subCategoryState = true;
                            subCategory = [
                              "فروش آپارتمان",
                              "فروش خانه و ویلا",
                              "فروش خانه و ویلا"
                            ];
                          });
                        }),
                        item("فروش مسکونی", () {
                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("فروش دفاتر اداری و تجاری", () {
                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("اجاره دفاتر اداری و تجاری", () {
                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("اجاره کوتاه مدت", () {
                          setState(() {
                            subCategoryState = true;
                          });
                        }),
                        item("پروژه های ساخت و ساز", () {
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
    return InkWell(
      onTap: () {
        subCategory = [];

        ontap_();
      },
      child: Container(
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
