import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class LinkText extends StatelessWidget {
  final label;
  final Color pallete;
  final double fontSize;
  const LinkText(
      {super.key,
      required this.label,
      this.pallete = Pallete.forgotPass,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("he");
      },
      child: Text(
        label,
        style: TextStyle(
            color: pallete, fontFamily: "UrbanistSB", fontSize: fontSize),
      ),
    );
  }
}
