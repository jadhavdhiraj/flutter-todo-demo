import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxDouble opacity = .1.obs;

  setOpacity(double value) {
    opacity.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
