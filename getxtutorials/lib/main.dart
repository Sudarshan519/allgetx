import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxtutorials/getxtutorials/1.snackbar.dart';
import 'package:getxtutorials/getxtutorials/2.statemanagement.dart';
import 'package:getxtutorials/getxtutorials/5.storageasync.dart';
import 'getxtutorials/3.intl.dart';
import 'getxtutorials/4.dependencyInject.dart';
import 'getxtutorials/6.getxService.dart';
import 'getxtutorials/7.controllerbinding.dart';
Future<void> main() async {
    await GetStorage.init();

  runApp(MyApp());
}
initService() async {
  print('Starting services');
  await Get.putAsync<GGetxService> (()async=>await GGetxService());
  print('All services started');
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      title: 'Getx Tutorials',
      locale: Locale('en', 'US'), //Get.device local
      fallbackLocale: Locale('en', 'US'), //if wrong or not avaivable is chosen
initialBinding: AllControllerBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: '/notfound',

      home: UnknownRoute(),
      getPages: [
        GetPage(
            name: '/notfound',
            page: () => GetxSnackBar(),
            transition: Transition.leftToRight),
         //   GetPage(name: '/home', page: ()=>Home(),binding: HomeControllerBinding()),
        GetPage(
            name: '/statemgmt',
            page: () => GetxStateMgmt(),
            transition: Transition.leftToRight),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoute()),
    );
  }
}

class UnknownRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Column(
        children: [
          Container(child: Text('Page not found')),
          ListTile(
              title: Text('Chapter1 Snackbar'),
              onTap: () {
                Get.to(Internationaliztion());
              }),
               ListTile(
              title: Text('Chapter1 Snackbar'),
              onTap: () {
                Get.to(DependencyInject());
              }),
                ListTile(
              title: Text('Chapter1 Storage Demo'),
              onTap: () {
                Get.to(GetStorageDemo());
              }),   ListTile(
              title: Text('Chapter1 GetxService'),
              onTap: () {
                Get.to(GetStorageDemo());
              }),
                 ListTile(
              title: Text('Chapter1 Binding Demo'),
              onTap: () {
                Get.to(MyBindingTest(),binding: AllControllerBinding());
              }),
                 ListTile(
              title: Text('Chapter1 GetxApi Demo'),
              onTap: () {
                Get.to(GetStorageDemo());
              }),
        ],
      ),
    );
  }
}
