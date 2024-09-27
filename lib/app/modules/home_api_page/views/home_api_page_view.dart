import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_demo/app/modules/add_api_task_page/views/add_api_task_page_view.dart';

import '../controllers/home_api_page_controller.dart';

class HomeApiPageView extends GetView<HomeApiPageController> {
  final HomeApiPageController homeApiPageController =
      Get.put(HomeApiPageController());
  final TextEditingController editController = TextEditingController();
  HomeApiPageView({super.key});

  @override
  Widget build(BuildContext context) {
    homeApiPageController.fetchTodos();
    return Scaffold(
        appBar: AppBar(
            title: const Text('HomeApiPageView'),
            centerTitle: true,
            actions: [
              PopupMenuButton<String>(
                onSelected: (String result) {
                  if (result == 'option1') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Select Task Limit"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text("10"),
                                onTap: () {
                                  controller.fetchTasks(10, 0);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: const Text("20"),
                                onTap: () {
                                  controller.fetchTasks(20, 0);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: const Text("30"),
                                onTap: () {
                                  controller.fetchTasks(30, 0);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (result == 'option2') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Select Tasks to Skip"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text("10"),
                                onTap: () {
                                  controller.fetchTasks(10, 10);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: const Text("20"),
                                onTap: () {
                                  controller.fetchTasks(10, 20);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: const Text("30"),
                                onTap: () {
                                  controller.fetchTasks(10, 30);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('Limit the Tasks'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Skip the tasks'),
                  ),
                ],
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => ListView.builder(
                    itemCount: homeApiPageController.todos.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final todo = homeApiPageController.todos[index];
                      return ListTile(
                        title: Text(todo['todo']),
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
                                            maxLines: 5,
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
                                controller.deleteTodoById(todo['id']);
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
              ElevatedButton(
                onPressed: () {
                  Get.to(() => AddApiTaskPageView());
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.orangeAccent),
                child: const Text("Add Task"),
              )
            ],
          ),
        ));
  }
}
