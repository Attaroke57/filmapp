import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final Color backgroundColor;
  final Color TextColor;
  final double radius;
  final double elevation;
  final void Function()? onPressed;

  const MyButton(
    { super.key,
    required this.textButton,
    required this.backgroundColor,
    required this.TextColor,
    required this.radius,
    required this.elevation,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
            width: constraints.maxWidth,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(textButton),
              style: ElevatedButton.styleFrom(
               backgroundColor: backgroundColor,
                foregroundColor: TextColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                elevation: elevation,
              ),
            ),
          ),
        );
      },
    );
  }
}
