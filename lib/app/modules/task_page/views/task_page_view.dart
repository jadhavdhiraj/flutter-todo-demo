import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_page_controller.dart';

class TaskPageView extends GetView<TaskPageController> {
  TaskPageView({super.key});
  final TaskPageController taskPageController = Get.put(TaskPageController());
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('TaskPageView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Obx(() => ListView.builder(
                itemCount: taskPageController.tasks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(taskPageController.tasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Edit Task"),
                                      content: TextField(
                                        controller: editController,
                                        decoration: const InputDecoration(
                                          labelText: 'Edit your task',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            taskPageController.editTask(
                                                index, editController.text);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Save'),
                                        ),
                                      ],
                                    ));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            taskPageController.deleteTask(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                fillColor: Colors.black12,
                hintText: "enter task description",
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              taskPageController.addTask(textEditingController.text);
              textEditingController.clear();
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.orangeAccent),
            child: const Text('Add Task'),
          ))
        ]),
      ),
    );
  }
}
