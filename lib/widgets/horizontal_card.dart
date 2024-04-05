import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:flutter/material.dart';

import '../screens/aviz_screen.dart';

class HorizontalCard extends StatelessWidget {
  HorizontalCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.date,
    this.isLiked = false,
    this.notification = false,
  });

  final String image;
  final String title;
  final String subTitle;
  final String price;
  final String date;

  bool isLiked = false;
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AvizScreen()),
        );
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: SizedBox(
          width: 343,
          height: 142,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 111,
                  height: 107,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(image),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: grey3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: red,
                            ),
                          ),
                          const Text(
                            ":قیمت",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                    iconSize: 14,
                                    fixedSize: const Size(30, 30),
                                    maximumSize: const Size(30, 30),
                                    minimumSize: const Size(30, 30),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(
                                    isLiked ? Iconsax.heart5 : Iconsax.heart,
                                    color: isLiked ? red : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                    iconSize: 14,
                                    maximumSize: const Size(30, 30),
                                    minimumSize: const Size(30, 30),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(
                                    notification
                                        ? Iconsax.notification5
                                        : Iconsax.notification,
                                    color: notification ? red : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              date,
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: grey3,
                                fontSize: 8,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
