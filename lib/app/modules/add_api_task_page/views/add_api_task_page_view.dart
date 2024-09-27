import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_demo/app/modules/home_api_page/controllers/home_api_page_controller.dart';

import '../controllers/add_api_task_page_controller.dart';

class AddApiTaskPageView extends GetView<AddApiTaskPageController> {
  final TextEditingController textController = TextEditingController();
  final AddApiTaskPageController addApiTaskPageController =
      Get.put(AddApiTaskPageController());

  AddApiTaskPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddApiTaskPageView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Enter your notes',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              addApiTaskPageController.addTask(textController.text, 30);
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.orangeAccent),
            child: const Text("Add Task"),
          )
        ],
      ),
    );
  }
}
