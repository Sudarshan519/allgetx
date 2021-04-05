import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todowithgetx/app/modules/home/providers/hero_provider.dart';

import '../hero_model.dart';

class HerocontrollerController extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement HerocontrollerController
  var lstTask = List<dynamic>.empty(growable: true);
  final name = TextEditingController();
  final description = TextEditingController();

  final count = 0.obs;
  var isProcessing = false.obs;
  var selectedPriority = 1.obs;
  var isDataProcessing = false.obs;
  @override
  void onInit() {
    super.onInit();
    getTask();
    HeroProvider().getTask().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getTask() async {
    try {
      isDataProcessing(true);

      HeroProvider().getTask().then((resp) {
        isDataProcessing(false);

        lstTask.addAll(resp);
      }, onError: (err) {
        showSnackBar(
          "Error",
          err.toString(),
        );
      });
    } catch (e) {
      isDataProcessing(false);
      showSnackBar(
        "Error",
        e.toString(),
      );
    }
  }

  void saveTask(Map data) {
    try {
      isProcessing(true);

      clearTextEditingControllers();
      isProcessing(false);
      showSnackBar('Add task ', 'Task Added');

      lstTask.clear();
      refreshList();
    } catch (e) {}
  }

  void refreshList() {
    getTask();
  }

  void clearTextEditingControllers() {
    name.clear();
    description.clear();
  }
}

//common snackbar
showSnackBar(
  String title,
  String message,
) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
  );
}
