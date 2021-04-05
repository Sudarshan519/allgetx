import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'heros_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  Get.to(TodoApp());
                },
                child: Icon(Icons.arrow_forward)),
          ],
        ),
        body: controller.obx(
          (data) => ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(data[i]['picture']['large']),
                        ),
                        title: Text(data[i]['name']['title'] +
                            ' ' +
                            data[i]['name']['first'] +
                            ' ' +
                            data[i]['name']['last']),
                        subtitle: Text(
                          data[i]['email'],
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "Age:" + data[i]['dob']['age'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
