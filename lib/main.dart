import 'package:ecommerce/WelcomeScreen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const Aviz());
}

class Aviz extends StatefulWidget {
  const Aviz({super.key});

  @override
  State<Aviz> createState() => _AvizState();
}

class _AvizState extends State<Aviz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Shabnam",
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.black, fontFamily: "Shabnam"),
          )),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
