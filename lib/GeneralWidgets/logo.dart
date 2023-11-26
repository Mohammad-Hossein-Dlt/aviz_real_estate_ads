import 'package:aviz/Constants/colors.dart';
import 'package:aviz/iconsax_icons.dart';
import 'package:flutter/material.dart';

class AvizLogo extends StatelessWidget {
  const AvizLogo({super.key, this.isActive});
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Iconsax.tag,
            color: isActive != null
                ? isActive != false
                    ? red
                    : grey3
                : grey3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Transform.scale(
            scaleX: -1,
            child: Icon(
              Iconsax.tag5,
              color: isActive != null
                  ? isActive != false
                      ? red
                      : grey3
                  : grey3,
            ),
          ),
        ),
      ],
    );
  }
}
