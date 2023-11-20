import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/custom_title.dart';
import 'package:ecommerce/GeneralWidgets/map.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AvizScreen extends StatefulWidget {
  const AvizScreen({super.key});

  @override
  State<AvizScreen> createState() => _AvizScreenState();
}

class _AvizScreenState extends State<AvizScreen> {
  String curentInfoState = "مشخصات";
  Widget details = Container();
  @override
  void initState() {
    super.initState();

    details = specifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 200,
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
        leading: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Icon(
                Iconsax.archive,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(
                Iconsax.share,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(
                Iconsax.information,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/p5.png"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "۱۶ دقیقه پیش در گرگان",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: grey3,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Text(
                          "آپارتمان",
                          style: TextStyle(
                              color: red,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "آپارتمان ۵۰۰ متری در صیاد شیرازی",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 343,
                      height: 48,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: grey),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Iconsax.arrow_left_2,
                              color: grey3,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Text(
                              "هشدار های قبل از معامله!",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoItems("توضیحات"),
                        infoItems("ویژگی ها و امکانات"),
                        infoItems("قیمت"),
                        infoItems("مشخصات"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    details,
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red,
                      minimumSize: const Size(159, 40),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "اطلاعات تماس",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Iconsax.call,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red,
                      minimumSize: const Size(159, 40),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "گفتگو",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Iconsax.message,
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
        ],
      )),
    );
  }

  Widget infoItems(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          curentInfoState = text;
          if (curentInfoState == "مشخصات") {
            details = specifications();
          } else if (curentInfoState == "قیمت") {
            details = price();
          } else if (curentInfoState == "ویژگی ها و امکانات") {
            details = possibilities([
              "آسانسور",
              "پارکینگ",
              "انباری",
              "بالکن",
              "پنت هاوس",
              "جنس کف سرامیک",
              "سرویس بهداشتی ایرانی و فرنگی"
            ]);
          } else if (curentInfoState == "توضیحات") {
            details = const Text(
              "ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: grey3,
              ),
            );
          }
        });
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: curentInfoState == text ? red : grey),
            color: curentInfoState == text ? red : Colors.white),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: curentInfoState == text ? Colors.white : red,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget price() {
    return Container(
      width: 343,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: grey),
      ),
      child: const Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: 343,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "۴۶٬۴۶۰٬۰۰۰",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16, color: grey3),
                ),
                Text(
                  "قیمت هر متر:",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16, color: grey3),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 343,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "۲۳٬۲۳۰٬۰۰۰٬۰۰۰",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16, color: grey3),
                ),
                Text(
                  "قیمت کل:",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16, color: grey3),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget possibilities(List<String> items) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTitle(
              text: "ویژگی ها",
              icon: Icon(
                Iconsax.clipboard,
                color: red,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: 343,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey),
          ),
          child: const Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 343,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تک برگ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey3),
                    ),
                    Text(
                      "سند",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 343,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "شمالی",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey3),
                    ),
                    Text(
                      "جهت ساختمان",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTitle(
              text: "امکانات",
              icon: Icon(
                Iconsax.magicpen,
                color: red,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: 343,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey),
          ),
          child: Column(
            children: [
              ...items.map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: grey3),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget specifications() {
    return Column(
      children: [
        Container(
          width: 343,
          height: 98,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: grey),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ساخت",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("1402"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: VerticalDivider(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "طبقه",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("دوبلکس"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: VerticalDivider(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اتاق",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("۶"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: VerticalDivider(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "متراژ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("۵۰۰"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTitle(
              text: "موقعیت مکانی",
              icon: Icon(
                Iconsax.map,
                color: red,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const CustomMapWidget(),
      ],
    );
  }
}
