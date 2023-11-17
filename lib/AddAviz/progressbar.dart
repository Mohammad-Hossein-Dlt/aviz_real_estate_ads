import 'package:ecommerce/Constants/colors.dart';
import 'package:flutter/material.dart';

class AddAvizProgressbar extends StatelessWidget {
  const AddAvizProgressbar({super.key, required this.progress});
  final int progress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width / 5) * progress,
          height: 4,
          color: red,
        ),
      ],
    );
  }
}
