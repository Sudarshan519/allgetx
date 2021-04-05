import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class GetxStateMgmt extends StatelessWidget {
  var count =0.obs;
  var string='Ram'.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Obx(()=>TextButton(child: Text('Increment$count${string.value}'),onPressed: _increment,
    )));
        }
      
        void _increment() {
          string.value=string.value.toUpperCase();
          count++;
  }
}