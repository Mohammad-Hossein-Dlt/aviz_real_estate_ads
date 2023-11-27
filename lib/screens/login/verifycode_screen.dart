import 'package:aviz/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pinput/pinput.dart';

import '../main_screen.dart';

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
                      MaterialPageRoute(
                          builder: (context) => MainScreenNavigationBar()),
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
