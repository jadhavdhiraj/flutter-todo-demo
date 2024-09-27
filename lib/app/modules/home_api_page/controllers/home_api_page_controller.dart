import 'package:get/get.dart';
import 'package:todo_demo/app/modules/home_api_page/views/home_api_page_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApiPageController extends GetxController {
  //TODO: Implement HomeApiPageController

  RxList<Map<String, dynamic>> todos = <Map<String, dynamic>>[].obs;

  Future<void> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/todos'));

      if (response.statusCode == 200) {
        var todoJson = jsonDecode(response.body)['todos'] as List;

        todos.assignAll(todoJson.cast<Map<String, dynamic>>());
      } else {
        Get.snackbar('Error', 'Failed to load tasks');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> deleteTodoById(int id) async {
    try {
      final response =
          await http.delete(Uri.parse('https://dummyjson.com/todos/$id'));

      if (response.statusCode == 200) {
        todos.removeWhere((todo) => todo['id'] == id);
        Get.snackbar('Success', 'Todo deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete todo');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> fetchTasks(int limit, int skip) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/todos?limit=$limit&skip=$skip'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<dynamic> fetchedTodos = data['todos'];
      todos.value = fetchedTodos.cast<Map<String, dynamic>>();
    }
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
