import 'package:get/get.dart';
import 'package:tugas_getx_movie/controller/dashboardcontroller.dart';
class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dashboardcontroller());

    
  }
}