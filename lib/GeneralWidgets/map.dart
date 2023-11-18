import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class CustomMapWidget extends StatelessWidget {
  const CustomMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 343,
          height: 144,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: FittedBox(
                fit: BoxFit.fill, child: Image.asset("assets/images/maps.png")),
          ),
        ),
        Container(
          width: 185,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: red, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Row(
            children: [
              Icon(
                Iconsax.location,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: Text(
                  "گرگان، صیاد شیرازی",
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
