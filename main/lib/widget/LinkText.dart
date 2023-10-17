import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class LinkText extends StatelessWidget {
  final label;
  final Color pallete;
  final double fontSize;
  final Widget routeName;

  const LinkText(
      {super.key,
      required this.label,
      this.pallete = Pallete.forgotPass,
      this.fontSize = 14,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => routeName,
            ));
      },
      child: Text(
        label,
        style: TextStyle(
            color: pallete, fontFamily: "UrbanistSB", fontSize: fontSize),
      ),
    );
  }
}
