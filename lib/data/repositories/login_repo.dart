import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/data/providers/api_provider.dart';
import 'package:default_project/models/universal_model.dart';

class LoginRepo{
  final ApiProvider apiProvider;
  LoginRepo({required this.apiProvider});
  Future<bool> loginUser({required String username,required String password})async{
    UniversalResponse universalResponse = await apiProvider.loginUser(username: username, password: password);
    if(universalResponse.error.isEmpty){
      await StorageRepository.putString('token', universalResponse.data as String);
      return true;
    }
  return false;
  }
}


