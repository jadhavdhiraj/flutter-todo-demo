import 'package:get/get.dart';

import '../controllers/home_api_page_controller.dart';

class HomeApiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeApiPageController>(
      () => HomeApiPageController(),
    );
  }
}
