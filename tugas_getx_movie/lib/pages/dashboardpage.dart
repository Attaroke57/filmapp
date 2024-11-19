import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/dashboardcontroller.dart';
import 'package:tugas_getx_movie/menu/HomeMenu.dart';
import 'package:tugas_getx_movie/menu/FavoriteMenu.dart';
import 'package:tugas_getx_movie/menu/ProfileMenu.dart';
import 'package:tugas_getx_movie/menu/responsif_table/responsif_layout.dart';


class DashboardPage extends StatelessWidget {
   DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Dashboardcontroller dashboardController = Get.find();

    final List<Widget> menus = [
       HomeMenu(),
       FavoriteMenu(),
       ResponsifLayout(),
       ProfileMenu()
    ];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) {
            dashboardController.selectedIndex.value = index;
          },
          selectedItemColor: const Color.fromARGB(255, 174, 157, 5),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              backgroundColor: Colors.black,
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: "ComingSoon",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
