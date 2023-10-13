import 'package:flutter/material.dart';
import 'package:main/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final double horizontalPadding;
  final bool obscured;
  const LoginField(
      {Key? key,
      required this.hintText,
      this.horizontalPadding = 340,
      this.obscured = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: horizontalPadding,
        ),
        child: TextFormField(
            obscureText: obscured,
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
              hintStyle: const TextStyle(
                color: Pallete.hintText,
                fontFamily: "UrbanistM",
              ),
            ),
            style:
                const TextStyle(color: Colors.black, fontFamily: "UrbanistM")));
  }
}
