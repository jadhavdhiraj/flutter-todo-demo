import 'package:get/get.dart';

import '../modules/add_api_task_page/bindings/add_api_task_page_binding.dart';
import '../modules/add_api_task_page/views/add_api_task_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_api_page/bindings/home_api_page_binding.dart';
import '../modules/home_api_page/views/home_api_page_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/task_page/bindings/task_page_binding.dart';
import '../modules/task_page/views/task_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_API_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASK_PAGE,
      page: () => TaskPageView(),
      binding: TaskPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_API_PAGE,
      page: () => HomeApiPageView(),
      binding: HomeApiPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_API_TASK_PAGE,
      page: () => AddApiTaskPageView(),
      binding: AddApiTaskPageBinding(),
    ),
  ];
}
