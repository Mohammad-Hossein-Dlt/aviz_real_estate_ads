import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AvizLogo extends StatelessWidget {
  AvizLogo({super.key, this.isActive = true});
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Iconsax.tag,
            color: isActive ? red : grey3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Transform.scale(
            scaleX: -1,
            child: Icon(
              Iconsax.tag5,
              color: isActive ? red : grey3,
            ),
          ),
        ),
      ],
    );
  }
}
