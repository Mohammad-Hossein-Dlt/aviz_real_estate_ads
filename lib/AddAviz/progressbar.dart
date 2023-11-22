import 'package:ecommerce/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddAvizProgressbar extends StatelessWidget {
  const AddAvizProgressbar({super.key, required this.progress});

  final double progress;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.zero,
      animation: true,
      lineHeight: 4,
      fillColor: red,
      backgroundColor: Colors.white,
      isRTL: true,
      percent: progress,
      trailing: null,
      leading: null,
      center: null,
      widgetIndicator: null,
    );
  }
}
