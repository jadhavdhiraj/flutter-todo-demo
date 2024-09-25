import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_demo/app/modules/task_page/views/task_page_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginPageView'),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Get.to(() => TaskPageView());
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.orangeAccent),
          child: const Text('Login'),
        )));
  }
}
