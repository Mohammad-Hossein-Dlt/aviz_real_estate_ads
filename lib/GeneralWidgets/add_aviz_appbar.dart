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
