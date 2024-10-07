import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/widget/my_text.dart';
import 'package:tugas_getx_movie/widget/my_image.dart';
import 'package:tugas_getx_movie/data/allData.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Profile', 
          style: TextStyle(
            fontSize: 20,
             color: Color.fromARGB(255, 201, 181, 4),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 30, 29, 29),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 45.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://foto.kontan.co.id/5rJWu7BOedHx8-He3Hbz3-A6wlk=/smart/2023/08/23/906860685p.jpg'), 
            ),
            SizedBox(height: 16),
            MyText(
              title: 'Hi Attar', 
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            MyText(
              title: 'Attarhoreg20@gmail.com', 
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 123, 119, 119),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
