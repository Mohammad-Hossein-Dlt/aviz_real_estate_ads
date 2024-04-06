import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/addAviz/aviz_data.dart';
import 'package:aviz/screens/addAviz/categories_screen.dart';
import 'package:aviz/screens/addAviz/get_information_screen.dart';
import 'package:aviz/screens/addAviz/possibilities_screen.dart';
import 'package:flutter/material.dart';

import 'get_location_screen.dart';

abstract class AddAvizState {}

class CategotyState extends AddAvizState {}

class SubCategotyState extends AddAvizState {}

class GetLocationState extends AddAvizState {}

class PossibilitiesState extends AddAvizState {}

class GetInformationState extends AddAvizState {}

class AddAvizScreen extends StatefulWidget {
  const AddAvizScreen({super.key});

  @override
  State<AddAvizScreen> createState() => _AddAvizScreenState();
}

class _AddAvizScreenState extends State<AddAvizScreen> {
  AddAvizState state = CategotyState();

  double width = 0;
  int progress = 0;
  String title = "دسته بندی";

  Map<String, List<String>> categories = {
    "اجاره مسکونی": [
      "فروش آپارتمان",
      "فروش خانه و ویلا",
      "فروش زمین و کلنگی",
    ],
    "فروش مسکونی": [],
    "فروش دفاتر اداری و تجاری": [],
    "اجاره دفاتر اداری و تجاری": [],
    "اجاره کوتاه مدت": [],
    "پروژه های ساخت و ساز": [],
  };

  AddAvizState onBackState() {
    if (state is CategotyState) {
      title = "دسته بندی";

      return CategotyState();
    }
    if (state is SubCategotyState) {
      title = "دسته بندی";

      return CategotyState();
    }
    if (state is GetLocationState) {
      title = "دسته بندی";

      return SubCategotyState();
    }
    if (state is PossibilitiesState) {
      title = "مکان";

      return GetLocationState();
    }
    if (state is GetInformationState) {
      title = "ویژگی های";

      return PossibilitiesState();
    }

    return CategotyState();
  }

  void changeState({required AddAvizState newState}) {
    setState(() {
      state = newState;
    });
  }

  @override
  void initState() {
    super.initState();

    AvizData.reset();
    AvizData.categoriesList = categories;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    if (state is CategotyState) {
      title = "دسته بندی";
      progress = 0;
    }
    if (state is SubCategotyState) {
      title = "دسته بندی";

      progress = 1;
    }
    if (state is GetLocationState) {
      title = "مکان";
      progress = 2;
    }
    if (state is PossibilitiesState) {
      title = "ویژگی های";
      progress = 3;
    }
    if (state is GetInformationState) {
      title = "اطلاعات";
      progress = 4;
    }

    return WillPopScope(
      onWillPop: () async {
        if (state is CategotyState) {
          Navigator.of(context).pop();
        } else {
          setState(() {
            state = onBackState();
          });
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: TextButton(
            onPressed: state is! CategotyState
                ? () {
                    setState(() {
                      AvizData.reset();
                      state = CategotyState();
                    });
                  }
                : null,
            child: Icon(
              Icons.close,
              color: state is! CategotyState ? Colors.black : grey3,
            ),
          ),
          actions: [
            TextButton(
              onPressed: state is! CategotyState
                  ? () {
                      setState(() {
                        state = onBackState();
                      });
                    }
                  : null,
              child: Transform.scale(
                scaleX: -1,
                child: Icon(
                  Iconsax.arrow_left_2,
                  color: state is! CategotyState ? Colors.black : grey3,
                ),
              ),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "آویز",
                style: TextStyle(
                  color: red,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  duration: const Duration(milliseconds: 400),
                  height: 4,
                  width: progress * 0.25 * width,
                  color: red,
                ),
              ),
              if (state is CategotyState)
                CategoriesScreen(
                  categories: categories,
                  onChange: (category) {
                    changeState(newState: SubCategotyState());
                  },
                ),
              if (state is SubCategotyState)
                SubCategoriesScreen(
                  onChange: (subCategory) {
                    changeState(newState: GetLocationState());
                  },
                ),
              if (state is GetLocationState)
                GetLocationScreen(
                  onChange: () {
                    changeState(newState: PossibilitiesState());
                  },
                ),
              if (state is PossibilitiesState)
                PossibilitiesScreen(
                  onChange: () {
                    changeState(newState: GetInformationState());
                  },
                ),
              if (state is GetInformationState)
                GetInformationScreen(
                  onChange: () {},
                )
            ],
          ),
        ),
      ),
    );
  }
}
