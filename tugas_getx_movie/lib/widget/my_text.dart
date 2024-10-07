import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final TextStyle? style; // TextStyle sebagai parameter opsional

  const MyText({
    required this.title,
    this.style, // Terima TextStyle dari luar
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? const TextStyle( // Jika style tidak dikirim, gunakan gaya default
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Warna default
      ),
    );
  }
}
