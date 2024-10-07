import 'package:flutter/material.dart';

class MyPoster extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color textColor;

  const MyPoster({
    required this.imageUrl,
    required this.title,
    this.textColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(2.20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50), 
            child: AspectRatio(
              aspectRatio: 2.1, 
              child: Image.network(
                imageUrl,
                height: 100,
                width: screenWidth, 
                fit: BoxFit.contain, 
              ),
            ),
          )
        ],
      ),
    );
  }
}
