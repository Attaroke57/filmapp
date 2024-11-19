import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Color? textColor;

  const MyText({
    required this.title,
    this.style,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}
