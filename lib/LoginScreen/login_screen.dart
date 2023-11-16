import 'package:ecommerce/Constants/colors.dart';
import 'package:ecommerce/GeneralWidgets/logo_with_text.dart';
import 'package:ecommerce/LoginScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/bg1.jpg"),
                    Image.asset("assets/images/bg2.jpg"),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "آگهی شماست",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: grey4),
                    ),
                    const SizedBox(width: 10),
                    AvizLogoWithText(),
                    const SizedBox(width: 10),
                    const Text(
                      "اینجا محل",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: grey4),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 305,
                  child: Text(
                    "در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: grey3,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SmoothPageIndicator(
                  controller:
                      PageController(viewportFraction: 1, initialPage: 1),
                  count: 3,
                  textDirection: TextDirection.rtl,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 4,
                    dotWidth: 4,
                    dotColor: grey2,
                    activeDotColor: red,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(159, 40),
                        side: const BorderSide(color: red),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text("ورود", style: TextStyle(color: red)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: const Size(159, 40),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text("ثبت نام"),
                    ),
                  ],
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
