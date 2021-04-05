import 'package:get/get.dart';

import 'package:todowithgetx/app/modules/home/bindings/home_binding.dart';
import 'package:todowithgetx/app/modules/home/views/heros_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => TodoApp(),
      binding: HomeBinding(),
    ),
  ];
}
