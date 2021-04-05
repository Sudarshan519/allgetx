import 'package:get/get.dart';

class TaskProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<String> saveTask(Map data) async {
    try {
      final response = await post("http://10.0.3.2:8000/heroes", data);
      if (response.status.hasError)
        return Future.error(response.statusText);
      else
        return response.body['result'];
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
