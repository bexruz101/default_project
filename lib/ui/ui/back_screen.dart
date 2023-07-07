import 'package:default_project/ui/model/game_model.dart';
import 'package:flutter/material.dart';
class BackScreen extends StatefulWidget {
  const BackScreen({super.key, required this.games});

  final GameModel games;

  @override
  State<BackScreen> createState() => _BackScreenState();
}

class _BackScreenState extends State<BackScreen> {
  @override
  Widget build(BuildContext context) {
     print(widget.games.thumbail);
     return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
             Image.network(widget.games.thumbail)
          ],
        ),
      ),
    );
  }
}
