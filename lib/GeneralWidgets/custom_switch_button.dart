import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/iconsax_icons.dart';
import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  CustomSwitchButton({super.key, required this.title, required this.active});
  final String title;
  bool active;
  @override
  State<CustomSwitchButton> createState() => CustomSwitchButtonState();
}

class CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(40, 48),
              maximumSize: const Size(40, 48),
            ),
            onPressed: () {
              setState(() {
                widget.active = !widget.active;
              });
            },
            child: Icon(
              widget.active
                  ? Iconsax.toggle_on_circle5
                  : Iconsax.toggle_off_circle,
              color: widget.active ? red : grey3,
              size: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
