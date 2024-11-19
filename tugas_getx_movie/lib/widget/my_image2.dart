import 'package:flutter/material.dart';
import 'my_text.dart';

class MyImage2 extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? genre;
  final String? age;

  const MyImage2({
    required this.imageUrl,
    required this.title,
    this.genre,
    this.age,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        MyText(
          title: title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (genre != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: MyText(
                  title: genre!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            const SizedBox(width: 5),
            if (age != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: MyText(
                  title: age!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
