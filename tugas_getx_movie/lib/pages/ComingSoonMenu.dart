import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/data/allData.dart';
import 'package:tugas_getx_movie/widget/my_image.dart';

class Comingsoonmenu extends StatelessWidget {
  const Comingsoonmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: Text(
          'Coming soon',
          style: TextStyle(
            color: Color.fromARGB(255, 201, 181, 4), 
          ),
        ),
        backgroundColor: Color.fromARGB(255, 30, 29, 29), 
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(90),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[850],
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyImage(
                            imageUrl: rows4[index]['imageUrl'] as String,
                            title: rows4[index]['title'] ?? "",
                          ),
                        
                        ],
                      ),
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
