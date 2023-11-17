import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo.dart';
import 'package:flutter/material.dart';

class AvizLogoWithText extends StatelessWidget {
  const AvizLogoWithText({super.key, this.isActive = true});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "آویز",
          style:
              TextStyle(color: red, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        SizedBox(width: 4),
        AvizLogo(isActive: true),
      ],
    );
  }
}
