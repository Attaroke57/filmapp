import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tugas_getx_movie/controller/responsif_controller.dart';
import 'package:tugas_getx_movie/menu/ComingSoonMenu.dart';
import 'package:tugas_getx_movie/menu/FavoriteMenu.dart';
import 'package:tugas_getx_movie/menu/responsif_table/gridtable_coming.dart';

class ResponsifLayout extends StatelessWidget {
  ResponsifLayout({super.key});
  final ResponsifController responsifController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(responsifController.isMobile()){
        return Comingsoonmenu();
      } else {
        return GridtableComing();
      }
    });
  }
}