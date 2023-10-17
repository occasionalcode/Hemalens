import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class Socialbutton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final Widget routeName;
  const Socialbutton(
      {Key? key,
      required this.label,
      this.horizontalPadding = 150,
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
            fontFamily: "UrbanistSB", fontSize: 15, color: Pallete.whiteColor),
      ),
      style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: 26, horizontal: horizontalPadding),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Pallete.almostBlack),
              borderRadius: BorderRadius.circular(8)),
          backgroundColor: Pallete.almostBlack),
    );
  }
}
