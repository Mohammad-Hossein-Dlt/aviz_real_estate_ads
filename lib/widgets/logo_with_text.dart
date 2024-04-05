import 'package:aviz/constants/colors.dart';
import 'package:aviz/widgets/logo.dart';
import 'package:flutter/material.dart';

class AvizLogoWithText extends StatelessWidget {
  const AvizLogoWithText({super.key, this.isActive = true});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "آویز",
          style: TextStyle(
              color: isActive ? red : grey3,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        // ignore: prefer_const_constructors
        SizedBox(width: 4),
        AvizLogo(isActive: isActive),
      ],
    );
  }
}
