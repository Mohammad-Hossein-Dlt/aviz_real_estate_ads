import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/screens/aviz_screen.dart';
import 'package:flutter/material.dart';

class BigAvizCard extends StatelessWidget {
  BigAvizCard({
    super.key,
    required this.type,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.date,
    this.paid = false,
    this.isLiked = false,
    this.notification = false,
  });

  final String type;
  final String image;
  final String title;
  final String subTitle;
  final String price;
  final String date;
  bool paid = false;

  bool isLiked = false;
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        left: 16.0,
        bottom: 0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AvizScreen()),
          );
        },
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 320,
                  height: 260,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(image),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.65),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              price,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            paid
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "پرداخت شده",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: IconButton(
                                          style: IconButton.styleFrom(
                                            iconSize: 20,
                                            fixedSize: const Size(40, 40),
                                            maximumSize: const Size(40, 40),
                                            minimumSize: const Size(40, 40),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            isLiked
                                                ? Iconsax.heart5
                                                : Iconsax.heart,
                                            color: isLiked ? red : grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: IconButton(
                                          style: IconButton.styleFrom(
                                            iconSize: 20,
                                            fixedSize: const Size(40, 40),
                                            maximumSize: const Size(40, 40),
                                            minimumSize: const Size(40, 40),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            notification
                                                ? Iconsax.notification5
                                                : Iconsax.notification,
                                            color: notification ? red : grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
