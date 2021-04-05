import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  Future<void> incrementCounter() async {
    GetStorage storage = GetStorage();
    int counter = await (storage.read('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await storage.write('counter', counter);
  }
}

class GetStorageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.putAsync(()async => await StorageController());
    return Container(
      child: RaisedButton(onPressed: (){
        Get.find<StorageController>();
        Get.find<StorageController>().incrementCounter();
      }),
    );
  }
}
