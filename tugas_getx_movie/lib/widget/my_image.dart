import 'package:flutter/material.dart';
import 'my_text.dart'; // Ganti dengan path yang sesuai

class MyImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color textColor;

  const MyImage({
    required this.imageUrl,
    required this.title,
    this.textColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          SizedBox(height: 5),
          Image.network(
            imageUrl,
            height: 170,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          MyText(
            title: title,  
           
          ),
        ],
      ),
    );
  }
}
