import 'package:get/get.dart';

import '../controllers/add_api_task_page_controller.dart';

class AddApiTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddApiTaskPageController>(
      () => AddApiTaskPageController(),
    );
  }
}
