import 'dart:convert';
import 'package:default_project/ui/model/game_model.dart';
import 'package:http/http.dart' as http;
import '../model/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllCurrencies() async {
    Uri uri = Uri.parse("https://www.freetogame.com/api/games");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => GameModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }
}