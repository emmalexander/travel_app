import 'package:flutter/cupertino.dart';
import 'package:travel_app/widgets/normal_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  String text;
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = 'Hi',
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon
          ? Center(child: Icon(icon, color: color))
          : Center(child: NormalText(text: text, color: color)),
    );
  }
}
