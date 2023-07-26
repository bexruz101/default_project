import 'package:default_project/data/providers/api_provider.dart';
import 'package:default_project/models/universal_model.dart';

class CategoryRepo{
  final ApiProvider apiProvider;

  CategoryRepo({required this.apiProvider});

  Future<List<String>> getAllCategories()async{
    UniversalResponse universalResponse = await apiProvider.getAllCategories();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as List<String>;
    }
    return [];
  }
}
