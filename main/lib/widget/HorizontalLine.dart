import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double height;
  final double width;
  final Color pallete;
  final EdgeInsets margin;
  const HorizontalLine({
    super.key,
    this.height = 1,
    this.width = 200,
    required this.pallete,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: pallete,
      margin: margin,
    );
  }
}
