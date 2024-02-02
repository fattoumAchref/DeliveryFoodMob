import 'package:flutter/material.dart';
import 'package:mysecondapp/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: "Chinese Side"),
      SizedBox(height: 10),
      Row(
        children: [
          Wrap(
              children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: Colors.blue,
              size: 15,
            );
          })),
          SizedBox(width: 10),
          SmallText(text: "4.5"),
          SizedBox(width: 10),
          SmallText(text: "1287"),
          SizedBox(width: 10),
          SmallText(text: "Comments")
        ],
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
            icon: Icons.circle_sharp,
            text: "Normal",
            iconColor: Colors.amber,
          ),
          IconAndTextWidget(
            icon: Icons.location_on,
            text: "1.72Km",
            iconColor: Colors.blue,
          ),
          IconAndTextWidget(
            icon: Icons.access_alarms_rounded,
            text: "32min",
            iconColor: Color.fromARGB(255, 217, 68, 27),
          )
        ],
      )
    ]);
  }
}
