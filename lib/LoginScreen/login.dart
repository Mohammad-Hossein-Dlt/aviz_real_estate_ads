import 'dart:async';

import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo_with_text.dart';
import 'package:ecommerce/MainScreen/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
                          builder: (context) => VerifyCode(
                                isLogin: true,
                              )),
                    );
                  },
                  child: const Text("مرحله بعد"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
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
                          builder: (context) => VerifyCode(
                                isLogin: false,
                              )),
                    );
                  },
                  child: const Text("مرحله بعد"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
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

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key, required this.isLogin});
  final bool isLogin;
  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final defaultPinTheme = PinTheme(
    width: 74,
    height: 48,
    textStyle: const TextStyle(
        fontSize: 20, color: grey3, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: grey,
      border: Border.all(color: grey),
      borderRadius: BorderRadius.circular(2),
    ),
  );

  late Timer countDown;

  Duration duration = const Duration(seconds: 59);

  void setCountDown() {
    int reduceSeconsBy = 1;
    setState(() {
      final curentSeconds = duration.inSeconds - reduceSeconsBy;
      if (curentSeconds <= 0) {
        duration = const Duration(seconds: 0);
        countDown.cancel();
      } else {
        duration = Duration(seconds: curentSeconds);
      }
    });
  }

  @override
  void initState() {
    countDown = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
    super.initState();
  }

  @override
  void dispose() {
    countDown.cancel();
    super.dispose();
  }

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
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("تایید شماره موبایل",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              widget.isLogin
                                  ? "کد ورود پیامک شده را وارد کنید"
                                  : "کد ثبت نام پیامک شده را وارد کنید",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
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
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: duration.inSeconds == 0 ? () {} : null,
                      child: Text("ارسال مجدد کد",
                          style: TextStyle(
                              color: duration.inSeconds == 0 ? red : grey3)),
                    ),
                    Text(
                      "${(duration.inSeconds / 60).floor()}:${(duration.inSeconds % 60).floor() < 10 ? 00 : ''}${(duration.inSeconds % 60).floor()}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
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
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: const Text("تایید ورود"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
