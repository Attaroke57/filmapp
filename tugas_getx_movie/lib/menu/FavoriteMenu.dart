// favorite_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/taskcontroller.dart';
import 'package:tugas_getx_movie/data/allData.dart';
import 'package:tugas_getx_movie/widget/my_image.dart';
import 'package:tugas_getx_movie/widget/my_text.dart';

class FavoriteMenu extends StatelessWidget {
  const FavoriteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Favorite Movie',
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
      body: Obx(() {
        if (taskController.favorites.isEmpty) {
          return const Center(
            child: Text(
              'No Favorites Yet',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: taskController.favorites.length,
          itemBuilder: (context, index) {
            final movie = taskController.favorites[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: SizedBox(
                width: 100, // Lebar penuh layar
                height: 230, // Atur tinggi card sesuai kebutuhan
                child: Card(
                  color: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        MyImage(
                          imageUrl: movie.imageUrl,
                          title: movie.title,
                          isFavorited: true,
                          onFavorite: () {
                            taskController.removeFavorite(movie);
                          },
                        ),
                        const SizedBox(width: 5 ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const SizedBox(height: 55 ),
                              MyText(
                                title: rows[index]['Genre'] ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              
                              MyText(
                                title: rows[index]['Age'] ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              MyText(
                                title: rows[index]['Director'] ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              MyText(
                                title: rows[index]['Rate'] ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            taskController.removeFavoriteWithConfirmation(movie);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
