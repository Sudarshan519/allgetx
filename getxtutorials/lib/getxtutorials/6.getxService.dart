import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GGetxService extends GetxService {
Future incrementCounter() async {
  GetStorage storage=GetStorage( );
  int counter=(storage.read('counter')??0)+1;
  print('Pressed $counter');
  await storage.write('counter',counter);
}
}


