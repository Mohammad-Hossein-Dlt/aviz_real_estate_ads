import 'package:aviz/constants/colors.dart';
import 'package:flutter/material.dart';

class SummaryText extends StatefulWidget {
  const SummaryText({
    super.key,
    required this.text,
    required this.summaryMaxLine,
    this.textStyle = const TextStyle(fontSize: 14),
  });
  final String text;
  final int summaryMaxLine;
  final TextStyle textStyle;
  @override
  State<SummaryText> createState() => _SummaryTextState();
}

class _SummaryTextState extends State<SummaryText> {
  bool summarize = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        summarize
            ? Text(
                widget.text,
                maxLines: widget.summaryMaxLine,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: widget.textStyle,
              )
            : Text(
                widget.text,
                textDirection: TextDirection.rtl,
                style: widget.textStyle,
              ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              setState(() {
                summarize = !summarize;
              });
            },
            child: Text(
              summarize ? "بیشتر" : "کمتر",
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 14,
                color: grey3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
