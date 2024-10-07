import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/dashboardcontroller.dart';
import 'package:tugas_getx_movie/pages/HomeMenu.dart';
import 'package:tugas_getx_movie/pages/SearchMenu.dart';
import 'package:tugas_getx_movie/pages/ProfileMenu.dart';
import 'package:tugas_getx_movie/pages/ComingSoonMenu.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the DashboardController
    final Dashboardcontroller dashboardController = 
    Get.find();


    // Define the list of menu widgets
    final List<Widget> menus = [
      HomeMenu(),
      SearchMenu(),
      Comingsoonmenu(),
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
       
      selectedItemColor: Color.fromARGB(255, 174, 157, 5),
      unselectedItemColor: Colors.white, 
      items: const [
        
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          backgroundColor: Colors.black,
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
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
