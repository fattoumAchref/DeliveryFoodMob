import 'package:flutter/material.dart';
import 'package:mysecondapp/widgets/small_text.dart';

class ExcandableText extends StatefulWidget {
  final String text;
  const ExcandableText({super.key, required this.text});

  @override
  State<ExcandableText> createState() => _ExcandableTextState();
}

class _ExcandableTextState extends State<ExcandableText> {
  late String firstHalf;
  late String secondhalf;

  bool hiddenText = true;
  double textHeight = 100;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: 15,
            )
          : Column(
              children: [
                SmallText(
                    size: 15,
                    height: 1.8,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondhalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(children: [
                    SmallText(
                      text: "Show more",
                      color: Color.fromARGB(255, 140, 245, 199),
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: Color.fromARGB(255, 155, 249, 205),
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
