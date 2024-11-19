import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/taskcontroller.dart';
import 'package:tugas_getx_movie/data/allData.dart';
import 'package:tugas_getx_movie/widget/my_image.dart';
import 'package:tugas_getx_movie/widget/my_poster.dart';
import 'package:tugas_getx_movie/models/moviemodel.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    taskController.fetchFavorites();

    return Scaffold(
      backgroundColor: Colors.black,
    appBar: AppBar(
  title: const Text(
    'C14HH 4K',
    style: TextStyle(
      color: Color.fromARGB(255, 201, 181, 4),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  backgroundColor: Colors.transparent,
  automaticallyImplyLeading: false,
  actions: [
     IconButton(
      icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 201, 181, 4)),
      onPressed: () {
      },
    ),
    IconButton(
      icon: const Icon(Icons.search, color: Color.fromARGB(255, 201, 181, 4)),
      onPressed: () {
      },
    ),
   
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(0.5),
        child: ListView(
          children: [
            SizedBox(
              height: 250, // Tinggi tetap untuk ListView horizontal pertama
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows3.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 455,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: MyPoster(
                      imageUrl: rows3[index]['imageUrl'] as String,
                      title: rows3[index]['title'] ?? '',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  final isFavorited = taskController.favorites.any(
                    (movie) => movie.title == rows[index]['title'],
                  );

                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: MyImage(
                      imageUrl: rows[index]['imageUrl'] as String,
                      title: rows[index]['title'],
                      isFavorited: isFavorited,
                      onFavorite: () {
                        taskController.addFavorite(Movie(
                          title: rows[index]['title'],
                          imageUrl: rows[index]['imageUrl'],
                          genre: '',
                        ));
                      },
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rows2.length,
                itemBuilder: (context, index) {
                  final isFavorited = taskController.favorites.any(
                    (movie) => movie.title == rows2[index]['title'],
                  );

                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: MyImage(
                      imageUrl: rows2[index]['imageUrl'] as String,
                      title: rows2[index]['title'],
                      isFavorited: isFavorited,
                      onFavorite: () {
                        taskController.addFavorite(Movie(
                          title: rows2[index]['title'],
                          imageUrl: rows2[index]['imageUrl'],
                          genre: '',
                        ));
                      },
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
