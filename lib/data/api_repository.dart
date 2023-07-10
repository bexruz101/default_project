import 'package:default_project/data/api_provider.dart';
import 'package:default_project/model/cards_model.dart';
import 'package:default_project/model/universal_repository.dart';

class CardsRepository {
  final ApiPorivder apiPorivder;

  CardsRepository({required this.apiPorivder});

  Future<List<CardsModel>> fetchCardsInfo()async{
    UniversalRepository universalRepository = await apiPorivder.getAllCardsInfo();
    if(universalRepository.error.isEmpty){
      return universalRepository.data as List<CardsModel>;
    }
    return [];
  }
}
