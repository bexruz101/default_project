import 'package:default_project/local/shared_repository.dart';
import 'package:flutter/material.dart';

import '../../data/my_repository.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(StorageRepository.getString('Rasmi')),
            Text(StorageRepository.getString('Nomi')),
            Text(StorageRepository.getString('Narxi')),
            Text(StorageRepository.getString('IkkinchiNarxi')),
          ],
        ),
      )
    );
  }
}
