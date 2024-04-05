import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'login_screen.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';

import 'verifycode_screen.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                          Text("خوش اومدی به ",
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
                              "!این فوق العادست که آویزو برای آگهی هات انتخاب کردی",
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
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      minLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        hintText: "نام و نام خانوادگی",
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
                const SizedBox(height: 10),
                Container(
                  width: 343,
                  // height: 48,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    border: Border.all(color: grey, width: 4),
                    color: grey,
                  ),
                  child: const Center(
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      minLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                isLogin: false,
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
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        "ورود",
                        style: TextStyle(color: red),
                      ),
                    ),
                    const Text(
                      "قبلا ثبت نام کردی؟",
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
