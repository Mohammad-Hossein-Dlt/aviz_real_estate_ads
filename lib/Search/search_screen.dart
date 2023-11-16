import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 10),
          header(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 343,
                // height: 48,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: grey, width: 2),
                ),
                child: const Center(
                  child: TextField(
                    autofocus: false,
                    textDirection: TextDirection.rtl,
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintTextDirection: TextDirection.rtl,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      hintText: "جستجو...",
                      hintStyle: TextStyle(
                        color: grey3,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      suffixIcon: Icon(
                        Iconsax.search_normal,
                        color: grey3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "آویز",
          style:
              TextStyle(color: red, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        SizedBox(width: 4),
        AvizLogo(),
      ],
    );
  }
}
