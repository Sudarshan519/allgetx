import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DependencyInject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => MyController(),tag: 'instance2',fenix: true) ;
    // final myController =
    //     Get.put(MyController(), tag: 'instance', permanent: true);
   // Get.create(() => MyController());more than instance
   //get.putAsync while performing asynchromous operaion
    return Material(
      child: Container(),
    );
  }
}

class MyController extends GetxController {}
