import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/models/moviemodel.dart';
import 'package:tugas_getx_movie/database/databasehelper.dart';

class TaskController extends GetxController {
  var favorites = <Movie>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  Future<void> addFavoriteWithConfirmation(Movie movie) async {
    try {
      await addFavorite(movie);
      Get.snackbar(
        'Success', 
        '${movie.title} has been added to favorites.',
        backgroundColor: Colors.yellow, // Set warna latar belakang snackbar
        colorText: Colors.black, // Set warna teks snackbar
      );
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to add ${movie.title} to favorites: $e',
        backgroundColor: Colors.red, // Set warna latar belakang snackbar
        colorText: Colors.white, // Set warna teks snackbar
      );
    }
  }

  Future<void> removeFavoriteWithConfirmation(Movie movie) async {
    Get.dialog(
      AlertDialog(
        title: const Text('Remove from Favorites'),
        content: Text('Are you sure you want to remove "${movie.title}" from your favorites?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await removeFavorite(movie);
                Get.back();
                Get.snackbar(
                  'Removed', 
                  '${movie.title} has been removed from favorites.',
                  backgroundColor: Colors.yellow, // Set warna latar belakang snackbar
                  colorText: Colors.black, // Set warna teks snackbar
                );
              } catch (e) {
                Get.snackbar(
                  'Error', 
                  'Failed to remove ${movie.title} from favorites: $e',
                  backgroundColor: Colors.red, // Set warna latar belakang snackbar
                  colorText: Colors.white, // Set warna teks snackbar
                );
              }
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> addFavorite(Movie movie) async {
    try {
      await _dbHelper.insertFavorite(movie);
      favorites.add(movie);
    } catch (e) {
      print("Error adding favorite: $e");
      throw e; // Throw error to be caught by addFavoriteWithConfirmation
    }
  }

  Future<void> removeFavorite(Movie movie) async {
    try {
      await _dbHelper.removeFavorite(movie.title);
      favorites.removeWhere((item) => item.title == movie.title); // Ensure it matches by title
    } catch (e) {
      print("Error removing favorite: $e");
      throw e; // Throw error to be caught by removeFavoriteWithConfirmation
    }
  }

  Future<void> fetchFavorites() async {
    try {
      final List<Movie> fetchedFavorites = await _dbHelper.getFavorites();
      favorites.assignAll(fetchedFavorites);
    } catch (e) {
      print("Error fetching favorites: $e");
    }
  }
}
