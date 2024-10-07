import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://w0.peakpx.com/wallpaper/127/68/HD-wallpaper-heart-deadpool.jpg',
                  height: 300,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Get.toNamed('/dashboard');
                  },
                  child: const Text("Get Started!"),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: const Text(
              "GET YOUR BEST ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Positioned(
            top: 100,
            left: 20,
            child: const Text(
              "EXPERIENCE AT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Positioned(
            top: 150,
            left: 20,
            child: const Text(
              "C14HH MOVIE 4K",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
