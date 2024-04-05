import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsSound = true;
  bool showNotifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: grey.withOpacity(0.5),
        title: const Text(
          "اعلان ها",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                maximumSize: const Size(34, 34),
                minimumSize: const Size(34, 34),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Center(
                child: Icon(
                  Iconsax.arrow_right_3,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            item(
              title: "صدای اعلان ها",
              value: notificationsSound,
              function: (bool value) {
                notificationsSound = value;
              },
            ),
            const Divider(),
            item(
              title: "نمایش اعلان ها",
              subTitle: "خاموش کردن نمایش اعلان ها در صفحه نمایش",
              value: showNotifications,
              function: (bool value) {
                showNotifications = value;
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget item({
    required String title,
    required bool value,
    String? subTitle,
    required Function(bool value) function,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          function(!value);
        });
      },
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 36,
                width: 46,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    activeTrackColor: red,
                    activeColor: Colors.white,
                    value: value,
                    onChanged: null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Text(
                      subTitle ?? "",
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: grey3,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
