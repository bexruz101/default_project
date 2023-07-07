import 'package:default_project/ui/data/api_provider.dart';
import 'package:default_project/ui/data/api_repository.dart';
import 'package:default_project/ui/model/game_model.dart';
import 'package:flutter/material.dart';

import 'back_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  final GameRepository gameRepository = GameRepository(apiProvider: ApiProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent,
      ),
      body: FutureBuilder<List<GameModel>>(
        future: gameRepository.fetchCurrencies(),
        builder:(
            BuildContext context,
            AsyncSnapshot<List<GameModel>> snapshot,
        ){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasData){
            List<GameModel> games = snapshot.data!;
            return games.isNotEmpty ? SizedBox(
              width:  double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('All Games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Expanded(
                    child: ListView(
                  children: List.generate(games.length, (index) => ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return BackScreen(games: games[index],);
                      }));
                    },
                    title: Text(games[index].title),
                    subtitle: Text(games[index].title),
                    trailing: Icon(Icons.arrow_right),
                  ))
                ))
              ],),
            ):const Center(child: Text('Xatolik sodir bo\'ldi'),);
          }
          return Center(child: Text('Error:${snapshot.error}'),);
        }
      )
    );
  }
}
