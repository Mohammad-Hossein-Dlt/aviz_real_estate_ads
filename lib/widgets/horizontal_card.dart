import 'package:aviz/constants/colors.dart';
import 'package:flutter/material.dart';

import '../screens/aviz_screen.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  final String image;
  final String title;
  final String subTitle;
  final String price;
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
          height: 139,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                    width: 111,
                    height: 107,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(image),
                      ),
                    )),
                const SizedBox(width: 12),
                SizedBox(
                  width: 184,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 184,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 184,
                        child: Text(
                          subTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: grey3),
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
                                color: red),
                          ),
                          const Text(
                            ":قیمت",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 12),
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
