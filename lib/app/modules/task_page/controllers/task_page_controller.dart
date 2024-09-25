import 'package:get/get.dart';

class TaskPageController extends GetxController {
  var tasks = <String>[].obs;

  void addTask(String task) {
    tasks.add(task);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void editTask(int index, String updatedTask) {
    tasks[index] = updatedTask;
  }

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

  // void increment() => count.value++;
}
