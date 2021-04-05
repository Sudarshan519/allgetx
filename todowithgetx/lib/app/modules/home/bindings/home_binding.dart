import 'package:get/get.dart';

import 'package:todowithgetx/app/modules/home/controllers/herocontroller_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HerocontrollerController>(
      () => HerocontrollerController(),
    );
    Get.lazyPut<HerocontrollerController>(
      () => HerocontrollerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
