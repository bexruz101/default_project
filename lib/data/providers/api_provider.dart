import 'dart:convert';
import 'package:default_project/models/product_model/product_model.dart';
import 'package:default_project/models/universal_model.dart';
import 'package:default_project/ui/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/user_model/user_model.dart';

class ApiProvider {
//----------------------Login Provider-------------------------

  Future<UniversalResponse> loginUser(
      {required String username, required String password}) async {
    Uri uri = Uri.parse('$baseUrl/auth/login');
    try {
      final response = await http
          .post(uri, body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        String token = jsonDecode(response.body)['token'];
        return UniversalResponse(data: token);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

//------------------------Product Provider-----------------------

  Future<UniversalResponse> getAllProducts() async {
    Uri uri = Uri.parse('$baseUrl/products');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductsByLimit({required int limit}) async {
    Uri uri = Uri.parse('$baseUrl/products?limit=$limit');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductsById({required int id}) async {
    Uri uri = Uri.parse('$baseUrl/products/$id');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> addProduct(ProductModel product) async {
    Uri uri = Uri.parse('$baseUrl/products');
    try {
      final response = await http.post(uri, body: jsonEncode(product.toJson()));
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> productUpdate(ProductModel product) async {
    Uri uri = Uri.parse('$baseUrl/products/${product.id}');
    try {
      final response = await http.put(uri, body: jsonEncode(product.toJson()));
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> deleteProduct(int id) async {
    Uri uri = Uri.parse('$baseUrl/products/$id');
    try {
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> sortProduct(String keyWord) async {
    Uri uri = Uri.parse('$baseUrl/products?sort=$keyWord');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductByCategory(
      {required String category}) async {
    Uri uri = Uri.parse('$baseUrl/products/category/$category');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => ProductModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  //-----------------------User Provider-----------------
  Future<UniversalResponse> getAllUsers() async {
    Uri url = Uri.parse('$baseUrl/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => UserModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  //------------------------------Category provider-----------------------------

  Future<UniversalResponse> getAllCategories() async {
    Uri url = Uri.parse('$baseUrl/products/categories');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => e as String)
              .toList(),
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
