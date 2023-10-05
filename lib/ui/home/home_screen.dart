import 'dart:math';
import 'package:default_project/domain/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _AgeTitle(),
            _AgeIncrementWidget(),
            _AgeDecrementWidget()
          ]),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserCubit>();
    return StreamBuilder(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          final age = snapshot.requireData.currentUser.age;
          return Text('$age');
        });
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserCubit>();
    return ElevatedButton(
        onPressed: bloc.incrementAge, child: const Text('+'));
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserCubit>();
    return ElevatedButton(
        onPressed: bloc.decrementAge, child: const Text('-'));
  }
}
