import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final double horizontalPadding;
  const LoginField(
      {Key? key, required this.hintText, this.horizontalPadding = 340})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: horizontalPadding,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.border,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle:
                TextStyle(color: Pallete.hintText, fontFamily: "UrbanistM"),
          ),
        ));
  }
}
