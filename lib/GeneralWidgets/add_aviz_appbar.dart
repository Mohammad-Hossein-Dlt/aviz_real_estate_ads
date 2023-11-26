import 'package:aviz/Constants/colors.dart';
import 'package:aviz/iconsax_icons.dart';
import 'package:flutter/material.dart';

AppBar addAvizAppBar({
  required BuildContext ctx,
  required Widget title,
  required Function? backButton,
  required Function? exitButton,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    leading: TextButton(
      onPressed: exitButton != null
          ? () {
              exitButton();
            }
          : null,
      child: Icon(
        Icons.close,
        color: exitButton != null ? Colors.black : grey3,
      ),
    ),
    actions: [
      TextButton(
        onPressed: backButton != null
            ? () {
                backButton();
              }
            : null,
        child: Transform.scale(
          scaleX: -1,
          child: Icon(
            Iconsax.arrow_left_2,
            color: backButton != null ? Colors.black : grey3,
          ),
        ),
      ),
    ],
    title: title,
  );
}
