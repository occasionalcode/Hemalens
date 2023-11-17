import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class Socialbutton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final Widget routeName;
  final double borderRadius;
  final double verticalPadding;
  final double fontSize;
  final Color bgColor;
  const Socialbutton(
      {Key? key,
      required this.label,
      this.horizontalPadding = 150,
      this.verticalPadding = 26,
      this.borderRadius = 8,
      this.fontSize = 15,
      this.bgColor = Pallete.almostBlack,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routeName));
      },
      child: Text(
        label,
        style: TextStyle(
            fontFamily: "UrbanistSB",
            fontSize: fontSize,
            color: Pallete.whiteColor),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: bgColor),
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: bgColor),
    );
  }
}
