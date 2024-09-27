import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddApiTaskPageController extends GetxController {
  RxList<Map<String, dynamic>> todos = <Map<String, dynamic>>[].obs;
  //TODO: Implement AddApiTaskPageController
  Future<void> addTask(String taskDescription, int userId) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/todos/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'todo': taskDescription,
        'userId': userId,
      }),
    );

    if (response.statusCode == 200) {
      var newTask = jsonDecode(response.body);
      todos.add(newTask);
    } else {}
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
