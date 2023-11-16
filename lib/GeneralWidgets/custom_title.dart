import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({super.key, required String this.text, required Icon this.icon});
  String text;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        icon,
      ],
    );
  }
}
