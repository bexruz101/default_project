// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:default_project/domain/data_providers/auth_api_provider.dart';
import 'package:default_project/domain/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _ViewModelAuthButtonSubmitState {canSubmit, authProccess, disable}

class _ViewModelState {
  final String authErrorTitle;
  final String login;
  final String password;
  final bool authInProcess;
  _ViewModelAuthButtonSubmitState get authButtonSubmitState {
    if (authInProcess) {
      return _ViewModelAuthButtonSubmitState.authProccess;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return _ViewModelAuthButtonSubmitState.canSubmit;
    }
    return _ViewModelAuthButtonSubmitState.disable;
  }

  _ViewModelState({
    this.authErrorTitle = '',
    this.login = '',
    this.password = '',
    this.authInProcess = false,
  });

  _ViewModelState copyWith({
    String? authErrorTitle,
    String? login,
    String? password,
    bool? authInProcess,
  }) {
    return _ViewModelState(
      authErrorTitle: authErrorTitle ?? this.authErrorTitle,
      login: login ?? this.login,
      password: password ?? this.password,
      authInProcess: authInProcess ?? this.authInProcess,
    );
  }
}

class _ViewModel extends ChangeNotifier {
  var _state = _ViewModelState();
  final _authService = AuthService();
  _ViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {
    final login = _state.login;
    final password = _state.password;
    if (login.isEmpty || password.isEmpty) return;

    _state = _state.copyWith(authErrorTitle: '',authInProcess: true);
      notifyListeners();

    try {
      await _authService.login(login, password);
      _state = _state.copyWith(authInProcess: false);
      notifyListeners();
       Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    } on AuthApiProviderIncorrectPassword {
      _state = _state.copyWith(authErrorTitle: 'Login or Password wrong!',authInProcess: false);
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(authErrorTitle: 'Something went wrong',authInProcess: false);
      notifyListeners();
    }
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const AuthScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LoginWidget(),
          SizedBox(height: 10,),
          _PasswordWidget(),
           SizedBox(height: 10,),
          _ErrorTitleWidget(),
           SizedBox(height: 10,),
          _AuthButtonWidget()
        ],
      )),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
          labelText: 'Login', border: OutlineInputBorder()),
      onChanged: model.changeLogin,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
          labelText: 'Password', border: OutlineInputBorder()),
      onChanged: model.changePassword,
    );
  }
}

class _ErrorTitleWidget extends StatelessWidget {
  const _ErrorTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authErrorTitle =
        context.select((_ViewModel value) => value.state.authErrorTitle);
    return Text(authErrorTitle);
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    final authButtonState =
        context.select((_ViewModel value) => value.state.authButtonSubmitState);
    final onPressed =
        authButtonState == _ViewModelAuthButtonSubmitState.canSubmit
            ? model.onAuthButtonPressed
            : null;
    final child =
        authButtonState == _ViewModelAuthButtonSubmitState.authProccess
            ? const CircularProgressIndicator()
            : const Text('LogIn');
    return ElevatedButton(onPressed:()=> onPressed?.call(context), child: child);
  }
}
