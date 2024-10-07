import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tugas_getx_movie/pages/dashboardpage.dart';
import 'package:tugas_getx_movie/pages/loginpage.dart';
import 'bindings/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        // list all pages here
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: MyBindings()
        ),
      ],
    );
  }
}
