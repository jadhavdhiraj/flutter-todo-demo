import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => Container(
              height: 300,
              width: 300,
              color: Colors.black.withOpacity(homeController.opacity.value),
            ),
          ),
          Obx(() => Slider(
              value: homeController.opacity.value,
              onChanged: (value) => homeController.setOpacity(value)))
        ],
      ),
    );
  }
}
