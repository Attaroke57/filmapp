import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/data/allData.dart';
import 'package:tugas_getx_movie/widget/my_image.dart';
import 'package:tugas_getx_movie/widget/my_poster.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows3.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 450,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: MyPoster(
                      imageUrl: rows3[index]['imageUrl'] as String,
                      title: rows3[index]['title'] ?? '',
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            const Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: MyImage(
                      imageUrl: rows[index]['imageUrl'] as String,
                      title: rows[index]['title'],
                    ),
                  );
                },
              ),
            ),

           
            const SizedBox(height: 20),
            const Text(
              'Hot Kdrama',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows2.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child:
                     MyImage(
                      imageUrl: rows2[index]['imageUrl'] as String,
                      title: rows2[index]['title'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
