import 'package:ecommerce/AvizItem/aviz_item.dart';
import 'package:ecommerce/Constants/colors.dart';
import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  VerticalCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  String image;
  String title;
  String subTitle;
  String price;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AvizItem()),
        );
      },
      child: Card(
        elevation: 2,
        shadowColor: Color(0xffFFFFFF),
        child: SizedBox(
          width: 192,
          height: 235,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                    width: 192,
                    height: 112,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: FittedBox(
                            fit: BoxFit.cover, child: Image.asset(image)))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12, color: grey3),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: red),
                    ),
                    Text(
                      ":قیمت",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    )
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
