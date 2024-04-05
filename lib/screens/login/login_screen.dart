import 'package:aviz/constants/colors.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';

import '../../constants/iconsax_icons.dart';
import 'register_screen.dart';
import 'verifycode_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 76),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AvizLogoWithText(isActive: true),
                          SizedBox(width: 6),
                          Text("ورود به",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "!خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: grey3,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 343,
                  // height: 48,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    border: Border.all(color: grey, width: 4),
                    color: grey,
                  ),
                  child: const Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        minLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "شماره موبایل",
                          hintStyle: TextStyle(
                            color: grey3,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const VerifyCode(
                                isLogin: true,
                              )),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Iconsax.arrow_left_2,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Text("مرحله بعد"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text(
                        "ثبت نام",
                        style: TextStyle(color: red),
                      ),
                    ),
                    const Text(
                      "تاحالا ثبت نام نکردی؟",
                      style: TextStyle(color: grey3),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
