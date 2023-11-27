import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:flutter/material.dart';

class CustomMapWidget extends StatelessWidget {
  CustomMapWidget({super.key, required this.locationName});

  final String locationName;

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: red, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              const Icon(
                Iconsax.location,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: Text(
                  locationName,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
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
