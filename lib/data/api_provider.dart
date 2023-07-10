import 'dart:convert';

import 'package:default_project/model/cards_model.dart';
import 'package:http/http.dart' as http;
import '../model/universal_repository.dart';

class ApiPorivder {
  Future<UniversalRepository> getAllCardsInfo() async {
    Uri uri = Uri.parse('https://banking-api.free.mockoapp.net/user_cards');
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalRepository(
          data: (jsonDecode(response.body) as List?)?.map((e) =>
              CardsModel.fromJson(e)).toList() ?? [],
        );
      }
      return UniversalRepository(error: 'ERROR');
    }catch(e){
      return UniversalRepository(error: e.toString());
    }
  }
}