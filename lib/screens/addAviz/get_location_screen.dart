import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/aviz_data.dart';
import 'package:aviz/widgets/custom_switch_button.dart';
import 'package:aviz/widgets/custom_title.dart';
import 'package:aviz/widgets/map.dart';
import 'package:flutter/material.dart';

class GetLocationScreen extends StatelessWidget {
  GetLocationScreen({super.key, required this.onChange});
  final Function() onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              const CustomTitle(
                text: "موقعیت مکانی",
                icon: Icon(
                  Iconsax.map,
                  color: red,
                  size: 24,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.",
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 20),
              CustomMapWidget(locationName: "گرگان، صیاد شیرازی"),
              const SizedBox(height: 20),
              CustomSwitchButton(
                title: "موقعیت دقیق نقشه نمایش داده شود؟",
                active: AvizData.showlocation,
                onPressed: (isActive) {
                  AvizData.showlocation = isActive;
                },
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  minimumSize: const Size(320, 40),
                ),
                onPressed: () {
                  onChange();
                },
                child: const Text("بعدی"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
