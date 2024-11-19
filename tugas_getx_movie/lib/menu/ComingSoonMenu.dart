import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/data/allData.dart';

import 'package:tugas_getx_movie/widget/my_image2.dart';

class Comingsoonmenu extends StatelessWidget {
  const Comingsoonmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Coming Soon',
          style: TextStyle(
            color: Color.fromARGB(255, 201, 181, 4),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7, // Sesuaikan ratio agar sesuai dengan tampilan
          ),
          itemCount: rows4.length,
          itemBuilder: (context, index) {
            return MyImage2(
              imageUrl: rows4[index]['imageUrl'] as String,
              title: rows4[index]['title'] ?? '',
              genre: rows4[index]['Genre'],
              age: rows4[index]['Age'],
            );
          },
        ),
      ),
    );
  }
}
