import 'package:shared_preferences/shared_preferences.dart';

import '../user.dart';

class UserDataProvider {
  final sharedpreferences = SharedPreferences.getInstance();

  Future<User> loadValue() async {
    var age = (await sharedpreferences).getInt('age') ?? 0;
    return User(age);
  }

  Future<void> saveValue(User user) async {
    (await sharedpreferences).setInt('age', user.age);
 
  }
}
