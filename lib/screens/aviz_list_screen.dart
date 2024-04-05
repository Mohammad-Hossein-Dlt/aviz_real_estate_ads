import 'dart:math';
import 'dart:ui';
import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/sample_data.dart';
import 'package:aviz/utils/display_state.dart';
import 'package:aviz/widgets/horizontal_card.dart';
import 'package:aviz/widgets/logo_with_text.dart';
import 'package:aviz/widgets/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AvizListScreen extends StatefulWidget {
  const AvizListScreen({super.key, this.title});
  final String? title;

  @override
  State<AvizListScreen> createState() => _AvizListScreenState();
}

class _AvizListScreenState extends State<AvizListScreen> {
  Random random = Random();

  DisplayType displayType = DisplayTypleGrid();

  List<String> cities = [
    "تهران",
    "اصفهان",
    "شیراز",
    "مشهد",
  ];

  String? selectedCity;

  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();

  String orderBy = "All";

  Map<String, String> orderEntities = {
    "All": "همه",
    "MostViewed": "پر بازدیدترین ها",
    "Newest": "جدیدترین ها",
    "Oldest": "قدیمی ترین ها",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              title: widget.title != null
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.title!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : const AvizLogoWithText(isActive: true),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    if (displayType is DisplayTypleList) {
                      displayType = DisplayTypleGrid();
                    } else if (displayType is DisplayTypleGrid) {
                      displayType = DisplayTypleList();
                    }
                  });
                },
                icon: Icon(
                  displayType is DisplayTypleList
                      ? Iconsax.menu_1
                      : Iconsax.menu,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Transform.scale(
                    scaleX: -1,
                    child: const Icon(
                      Iconsax.arrow_left_2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 1,
                  color: grey1,
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 2,
              // forceElevated: true,
              shadowColor: grey,
              backgroundColor: Colors.white,
              leading: const SizedBox(height: 0),
              title: const SizedBox(height: 0),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              selectePriceDialog();
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Iconsax.arrow_down_1,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "قیمت",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              selectOrder();
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Iconsax.arrow_down_1,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "مرتب کردن",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              selecteCityDialog();
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Iconsax.arrow_down_1,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "شهر خود را انتخاب کنید",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  displayType is DisplayTypleList
                      ? listDisplay()
                      : gridDisplay(),
                  const SizedBox(height: 10),
                  const AvizLogoWithText(isActive: false),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridDisplay() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: Wrap(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            ...sampleData.values
                .map(
                  (e) => VerticalCard(
                    image: e["image"] ?? "",
                    title: e["title"] ?? "",
                    subTitle: e["subTitle"] ?? "",
                    price: e["price"] ?? "",
                    date: e["date"] ?? "",
                    idDynamic: true,
                    isLiked: random.nextInt(9) % 2 == 0,
                    notification: random.nextInt(9) % 2 == 0,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget listDisplay() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            ...sampleData.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: HorizontalCard(
                      image: e["image"] ?? "",
                      title: e["title"] ?? "",
                      subTitle: e["subTitle"] ?? "",
                      price: e["price"] ?? "",
                      date: e["date"] ?? "",
                      isLiked: random.nextInt(9) % 2 == 0,
                      notification: random.nextInt(9) % 2 == 0,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  void selectOrder() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 350,
        decoration: const BoxDecoration(
          // color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "ترتیب بر اساس:",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ...orderEntities.keys.map(
              (e) => TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: orderBy == e ? red : Colors.black,
                  maximumSize: const Size(double.infinity, 50),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  setState(() {
                    orderBy = e;
                  });
                  Navigator.of(ctx).pop();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    orderEntities[e] ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                maximumSize: const Size(double.infinity, 52),
                minimumSize: const Size(double.infinity, 52),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                "بستن",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selecteCityDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 340,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: grey2,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      maximumSize: const Size(34, 34),
                      minimumSize: const Size(34, 34),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: grey3,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                CityItems(
                    citesList: cities,
                    city: selectedCity,
                    selectedCity: (newCity) {
                      setState(() {
                        selectedCity = newCity;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("تایید"),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        selectedCity = null;
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("انتخاب همه"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectePriceDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 340,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: grey2,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      maximumSize: const Size(34, 34),
                      minimumSize: const Size(34, 34),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: grey3,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text("تومان"),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: grey2),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextField(
                            controller: priceFrom,
                            autofocus: false,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            minLines: 1,
                            keyboardType: TextInputType.number,
                            // textAlignVertical: TextAlignVertical.center,

                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              hintText: "از",
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text("تومان"),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: grey2),
                        ),
                        child: TextField(
                          controller: priceTo,
                          autofocus: false,
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: "تا",
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        priceFrom.clear();
                        priceTo.clear();
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("حذف"),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        selectedCity = null;
                        Navigator.of(ctx).pop();
                      },
                      child: const Text("اعمال فیلتر"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CityItems extends StatefulWidget {
  CityItems(
      {super.key,
      required this.citesList,
      required this.city,
      required this.selectedCity});
  final List<String> citesList;
  String? city;
  final Function(String city) selectedCity;

  @override
  State<CityItems> createState() => _CityItemsState();
}

class _CityItemsState extends State<CityItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: grey2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.arrow_down_1,
            color: Colors.black,
            size: 14,
          ),
          DropdownButton(
            hint: const SizedBox(
              width: 200,
              child: Text(
                "انتخاب شهر!",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: grey3,
                ),
              ),
            ),
            value: widget.city,
            elevation: 0,
            underline: const SizedBox(),
            icon: const SizedBox(),
            items: widget.citesList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                widget.city = value.toString();
                widget.selectedCity(value.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}
