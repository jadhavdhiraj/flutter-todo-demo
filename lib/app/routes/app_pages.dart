import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/task_page/bindings/task_page_binding.dart';
import '../modules/task_page/views/task_page_view.dart';
import '../modules/todo_page/bindings/todo_page_binding.dart';
import '../modules/todo_page/views/todo_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

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
      name: _Paths.TODO_PAGE,
      page: () => const TodoPageView(),
      binding: TodoPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
  ];
}
