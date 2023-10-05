import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:default_project/domain/data_providers/user_data_provider.dart';
import '../user.dart';

class UsersState {
  final User currentUser;
  UsersState({
    required this.currentUser,
  });

  UsersState copyWith({
    User? currentUser,
  }) {
    return UsersState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() => 'UsersState(currentUser: $currentUser)';

  @override
  bool operator ==(covariant UsersState other) {
    if (identical(this, other)) return true;

    return other.currentUser == currentUser;
  }

  @override
  int get hashCode => currentUser.hashCode;
}

class UserCubit extends Cubit<UsersState> {
  final _userDataProvider = UserDataProvider();

  UserCubit() : super(UsersState(currentUser: User(0))) {
    _initilalize();
  }

  Future<void> _initilalize() async {
    final user = await _userDataProvider.loadValue();
    final newState = state.copyWith(currentUser: user);
    emit(state.copyWith(currentUser: user));
  }

  void incrementAge(){
    var user = state.currentUser;
    user = user.copyWith(age: user.age + 1);
    _userDataProvider.saveValue(user);
    emit(state.copyWith(currentUser: user));
  }

  void decrementAge() {
    var user = state.currentUser;
    user = user.copyWith(age: max(user.age - 1, 0));
    _userDataProvider.saveValue(user);
     emit(state.copyWith(currentUser: user));
  }
}
