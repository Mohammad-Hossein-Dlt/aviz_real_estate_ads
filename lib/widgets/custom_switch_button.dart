import 'package:aviz/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  CustomSwitchButton(
      {super.key,
      required this.title,
      required this.active,
      required this.onPressed});
  final String title;
  bool active;
  Function(bool isActive) onPressed;
  @override
  State<CustomSwitchButton> createState() => CustomSwitchButtonState();
}

class CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.active = !widget.active;
          });
          widget.onPressed(widget.active);
        },
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Container(
          width: 343,
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 30,
                  width: 36,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      activeTrackColor: red,
                      activeColor: Colors.white,
                      value: widget.active,
                      onChanged: null,
                    ),
                  ),
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
        ),
      ),
    );
  }
}
