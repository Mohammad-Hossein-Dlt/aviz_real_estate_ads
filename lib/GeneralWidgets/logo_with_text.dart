import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AvizLogoWithText extends StatelessWidget {
  AvizLogoWithText({super.key, this.isActive = true});
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
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
