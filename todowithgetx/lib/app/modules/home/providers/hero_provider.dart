import 'package:get/get.dart';

import '../hero_model.dart';

class HeroProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => HeroModel.fromJson(map);
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  getTask() async {
    try {
      final response = await get('http://10.0.3.2:8000/heroes');
     // print(response.body);
      if (response.status.hasError)
        return Future.error(response.statusText);
      else {
      //print(response.body['data']);
        return response.body;
      }
    } catch (e) {}
  }

  Future<Response<HeroModel>> getHero(int id) async => await get('hero/$id');
  Future<Response<HeroModel>> postHero(HeroModel hero) async => await post('hero', hero);
  Future<Response> deleteHero(int id) async => await delete('hero/$id');
}
