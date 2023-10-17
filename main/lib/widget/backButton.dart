import 'package:flutter/material.dart';

class CustomBack extends StatelessWidget {
  // final Widget routename;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/back.png",
            width: 50, // Adjust the width as needed
            height: 50, // Adjust the height as needed
          ),
        ),
      ),
    );
  }
}
