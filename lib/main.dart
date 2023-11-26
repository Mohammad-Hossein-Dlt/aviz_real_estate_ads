import 'package:aviz/WelcomeScreen/welcome_screen.dart';
import 'package:aviz/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const Aviz());

  AppDataDirectory.appDataDirectory = (await getExternalStorageDirectory())!;
  if (!await AppDataDirectory.cache().exists()) {
    AppDataDirectory.cache().create(recursive: true);
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
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
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
        ),
        fontFamily: "Shabnam",
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black, fontFamily: "Shabnam"),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            surfaceTintColor: Colors.transparent,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            surfaceTintColor: Colors.transparent,
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
