import 'package:default_project/data/api_provider.dart';
import 'package:default_project/data/api_repository.dart';
import 'package:default_project/model/cards_model.dart';
import 'package:flutter/material.dart';

class CardsInfo1 extends StatefulWidget {
  const CardsInfo1({super.key});

  @override
  State<CardsInfo1> createState() => _CardsInfo1State();
}

class _CardsInfo1State extends State<CardsInfo1> {

  final CardsRepository cardsRepository = CardsRepository(apiPorivder: ApiPorivder());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Cards',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellowAccent,
      ),
      body: FutureBuilder<List<CardsModel>>(
        future:  cardsRepository.fetchCardsInfo(),
        builder:(
            BuildContext context,
            AsyncSnapshot<List<CardsModel>> snapshot
            ){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            List<CardsModel> cards = snapshot.data!;
            return cards.isNotEmpty ? ListView(
              children: List.generate(cards.length, (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                decoration: BoxDecoration(gradient:LinearGradient(colors: [Color(int.parse('0xFF${cards[index].colors["color_a"].toString().substring(1)}')),Color(int.parse('0xFF${cards[index].colors["color_b"].toString().substring(1)}'))]),borderRadius: BorderRadius.circular(20) ),
                width: double.infinity,
                padding: EdgeInsets.all(24),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cards[index].bankName,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                        Text(cards[index].cardType,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                      Text('${cards[index].moneyAmount}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                      const SizedBox(width: 10,),
                      Text(cards[index].cardCurrency,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                    ],),
                    const SizedBox(height: 15,),
                    Text(cards[index].cardNumber,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(cards[index].expireDate,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white)),
                      SizedBox(
                          width: 50,
                          height:50,
                          child: Image.network(cards[index].iconImage)
                      ),
                    ],)


                  ],
                ),
              )),
            ):const Center(child: Text('Error'),);
          }
          return Center(child: Text('Error:$snapshot.error'),);
        }
      )
    );
  }
}
