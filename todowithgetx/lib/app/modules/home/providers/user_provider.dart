import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => User.fromJson(map);
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  getUser() async {
    final response=await get('https://randomuser.me/api/?results=10');
    if(response.status.hasError)
  
  return Future.error(response.statusText);
  else
 { 
   print(response.body['results']);
   return response.body['results'];}}

  //Future<Response<User>> getUser(int id) async => await get('user/$id');
  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
