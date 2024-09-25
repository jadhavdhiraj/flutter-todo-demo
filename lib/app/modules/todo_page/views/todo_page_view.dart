import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_page_controller.dart';

class TodoPageView extends GetView<TodoPageController> {
  const TodoPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TodoPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
