import 'package:get/get.dart';

import '../controllers/task_page_controller.dart';

class TaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskPageController>(
      () => TaskPageController(),
    );
  }
}
