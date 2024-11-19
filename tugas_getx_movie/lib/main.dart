import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/dashboardcontroller.dart';
import 'package:tugas_getx_movie/pages/dashboardpage.dart';
import 'package:tugas_getx_movie/controller/taskcontroller.dart';
import 'package:tugas_getx_movie/menu/responsif_table/responsif_layout.dart';
import 'package:tugas_getx_movie/pages/loginpage.dart';
import 'package:tugas_getx_movie/controller/responsif_controller.dart'; 
import 'bindings/bindings.dart';

void main() {
  Get.put(TaskController());
  Get.put(ResponsifController());
   Get.put(Dashboardcontroller());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final ResponsifController reponsifController = 
    Get.put(ResponsifController());


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) { 
          //update screen here
          reponsifController.updateScreenWidth(constraints.maxWidth);
          return DashboardPage();
        }),
      ),

      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () =>  DashboardPage(),
          binding: MyBindings(),
        ),
      ],
    );
  }
}
