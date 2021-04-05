import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtutorials/getxtutorials/3.intl.dart';

import '5.storageasync.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut(() => StorageController());
     Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  var count = 0.obs;
  increment() {
    count++;
    print(count.value);
  }
}

class MyController extends GetxController {
  var count = 0.obs;
  increment() {
    count++;
    print(count.value);
  }
}

class MyBindingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        RaisedButton(
          onPressed: () {
            Get.find<MyController>().increment();
          },
          child: Text('count '),
        ),
        RaisedButton(
          onPressed: () {
            Get.to(Home(),binding: AllControllerBinding());
          },
          child: Text('count '),
        )
      ],
    ));
  }
}

class Home extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Get.find<HomeController>().increment();
        },
        child: Text('count'),
      ),
    );
  }
}
