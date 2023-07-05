import 'package:default_project/data/my_repository.dart';
import 'package:default_project/ui/homeback/background_screen.dart';
import 'package:default_project/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../local/shared_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'),elevation: 0,),
      body: SizedBox(
        width: double.infinity,
        child:Column(
          children: [
            Expanded(
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 30,mainAxisSpacing: 30),
                children: [
                  ...List.generate(6, (index) => ZoomTapAnimation(
                    onTap: (){
                      if(StorageRepository.getString('Password')==''&& StorageRepository.getString('Name')==''){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return BacckgroundScreen(indexx: index, modell: MyRepository.data[index],);
                        }));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple),
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 140),
                              child: LikeButton(
                                onTap:(isLike)async{
                                  setState(() {
                                    isLike = !isLike;
                                  });
                                  if(isLike){
                                    StorageRepository.putString('Rasmi', MyRepository.data[index].photo,);
                                    StorageRepository.putString('Nomi', MyRepository.data[index].name,);
                                    StorageRepository.putString('Narxi', MyRepository.data[index].price,);
                                    StorageRepository.putString('IkkinchiNarxi', MyRepository.data[index].secondPrice,);
                                  }
                                },
                                size: 30,
                                likeBuilder: (bool isLike) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                    Icons.favorite,
                                    color: isLike?Colors.red:Colors.grey,
                                  ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(MyRepository.data[index].photo,)),
                            SizedBox(height: 20,),
                            Text('Nomi ${MyRepository.data[index].name}',style: TextStyle(color: Colors.yellowAccent),),
                            Text('Narxi ${MyRepository.data[index].price}',style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.redAccent),),
                            Text(MyRepository.data[index].secondPrice,style: TextStyle(color: Colors.yellowAccent),),
                          ],
                        )
                      ),
                    ),
                  ))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
