import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello'},
        'hi_IN': {'hello': 'नमस्ते'},
        'fr_Fr': {'hello': 'Bonjour'}
      };
}

class Internationaliztion extends GetWidget {
  final myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'hello'.tr,
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
          RaisedButton(
              onPressed: () {
                myController.changeLanguage('en', 'US');
              },
              child: Text('Nepali')),
          RaisedButton(
              onPressed: () {
                myController.changeLanguage('hi', 'IN');
              },
              child: Text('Nepali')),
          RaisedButton(
              onPressed: () {
                myController.changeLanguage('fr', 'Fr');
              },
              child: Text('Nepali'))
        ],
      ),
    ));
  }
}

class MyController extends GetxController {
  void changeLanguage(String s, String ss) {
    var locale = Locale(s, ss);
    Get.updateLocale(locale);
  }
}
