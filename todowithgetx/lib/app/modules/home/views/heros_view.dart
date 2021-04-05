import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todowithgetx/app/modules/home/controllers/herocontroller_controller.dart';

import '../hero_model.dart';

class TodoApp extends GetWidget<HerocontrollerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   body: controller.obx(
        // (data) => ListView.builder(
        //     padding: EdgeInsets.all(8),
        //     itemCount: data.length,
        //     itemBuilder: (_, int i) {
        //       HeroModel hero = HeroModel.fromJson(data[i]);
        //       return Card(
        //         child: Column(
        //           children: [
        //             ListTile(
        //               leading: CircleAvatar(
        //                 radius: 30,
        //                 backgroundImage: NetworkImage(hero.image),
        //               ),
        //               title:Text(hero.name),
        //               subtitle: Text(hero.description),

        //             )
        //           ],
        //         ),
        //       );
        //     }),
        //)
        appBar: AppBar(title: Text('Todo App')),
        body: Obx(() {
          if (controller.isDataProcessing.value) {
            return CircularProgressIndicator();
          } else {
            return controller.lstTask.length > 0
                ? Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Active Task : ${controller.lstTask.length}',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))
                            ]),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                  child: Text('M'),
                                  backgroundColor: Colors.green),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CircleAvatar(
                                  child: Text('L'),
                                  backgroundColor: Colors.green),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CircleAvatar(
                                  child: Text('H'),
                                  backgroundColor: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                            child: ListView.builder(
                          itemCount: controller.lstTask.length,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          itemBuilder: (_, int i) {
                            HeroModel hero =
                                HeroModel.fromJson(controller.lstTask[i]);
                            return Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.green,
                                        child: Text(int.parse(
                                                    hero.taskPriority) ==
                                                1
                                            ? 'H'
                                            : int.parse(hero.taskPriority) == 2
                                                ? 'M'
                                                : 'L')),
                                    SizedBox(width: 20),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(hero.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(hero.description),
                                        ]),
                                    Spacer(),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.edit, color: Colors.green),
                                          Icon(Icons.delete, color: Colors.red),
                                        ]),
                                  ],
                                ));
                          },
                        ))
                      ],
                    ))
                : Center(child: Text('No data found'));
          }
        }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: displayAddTaskWindow,
            label: Row(children: [Icon(Icons.add), Text('Add new ask')])));
  }

  void displayAddTaskWindow() {
    final name = TextEditingController();
    final description = TextEditingController();
    String image;
    Get.bottomSheet(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text('Add task'),
                TextFormField(),
                TextFormField(),
                Text('Priority'),
                DropdownButton(
                  value: controller.selectedPriority.value,
                  onChanged: (v) {
                    controller.selectedPriority.value = v;
                  },
                  items: [
                    DropdownMenuItem(child: Text('High Priority'), value: 1),
                    DropdownMenuItem(child: Text('Medius Priority'), value: 2),
                    DropdownMenuItem(child: Text('Low Priority'), value: 3),
                  ],
                ),
                TextFormField(),
                TextButton(
                  onPressed: () {
                    controller.isProcessing.value = false;

                    print(name.text);
                    print(description.text);
                    print(image);
                    saveTask(
                                          name.text,
                                          description.text,
                                          controller.selectedPriority.value
                                        );
                    
                                      },
                                      child:Text(
                                        controller.isProcessing.value ?'Save':'Processing',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            isDismissible: true,
                            enableDrag: true);
                      }
                    
                      void saveTask(String title, String description, int priority) {
                        controller.saveTask({'name':title,'description':description,'priority':priority});
                      }
}
