abstract class AuthApiProviderError {}

class AuthApiProviderIncorrectPassword {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final isSuccess = login == 'admin' && password == '123456';
    if (isSuccess) {
      return 'asg34ergw9i7586ewhgrf243rf54';
    } else {
      throw AuthApiProviderIncorrectPassword();
    }
  }
}
