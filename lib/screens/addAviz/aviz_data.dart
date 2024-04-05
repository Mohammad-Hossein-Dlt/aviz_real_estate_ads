import 'package:flutter/material.dart';

class AvizData {
  static Map<String, List<String>> categoriesList = {};

  static String category = "";
  static String subCategory = "";

  static String location = "";
  static bool showlocation = true;

  static TextEditingController numberOfRooms = TextEditingController();
  static TextEditingController floor = TextEditingController();
  static TextEditingController metrage = TextEditingController();
  static TextEditingController yearOfConstruction = TextEditingController();

  static bool elevator = true;
  static bool parking = false;
  static bool warehouse = true;

  static String imagePath = "";
  static TextEditingController title = TextEditingController();
  static TextEditingController description = TextEditingController();

  static bool chat = false;
  static bool call = true;

  static void reset() {
    category = "";
    subCategory = "";

    location = "";
    showlocation = true;

    numberOfRooms.text = "";
    floor.text = "";
    metrage.text = "";
    yearOfConstruction.text = "";

    elevator = true;
    parking = false;
    warehouse = true;

    imagePath = "";
    title.text = "";
    description.text = "";

    chat = false;
    call = true;
  }
}
