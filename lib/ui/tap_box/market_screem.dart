import 'package:default_project/local/shared_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int count = 0;
  late int k;

  _count() async {
    count = await StorageRepository.getInt('count');
  }

  List<String> proudctsName = StorageRepository.getList('productsName');
  List<String> proudctsPrice = StorageRepository.getList('productsPrice');
  List<String> proudctsPicture = StorageRepository.getList('productsPhoto');
  List<String> proudctsCount = StorageRepository.getList('proudctsCount');

  @override
  void initState() {
    _count();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Market'),
          elevation: 0,
        ),
        body: proudctsName.isNotEmpty
            ? SizedBox(
                width: double.infinity,
                child: ListView(
                  children: List.generate(
                    proudctsName.length,
                    (index) => Slidable(
                      endActionPane: ActionPane(
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (v) {
                              setState(() {});
                              proudctsName.remove(proudctsName[index]);
                              proudctsPrice.remove(proudctsPrice[index]);
                              proudctsPicture.remove(proudctsPicture[index]);
                              proudctsCount.remove(proudctsCount[index]);
                              StorageRepository.putList(
                                  'productsName', proudctsName);
                              StorageRepository.putList(
                                  'productsPrice', proudctsPrice);
                              StorageRepository.putList(
                                  'productsPhoto', proudctsPicture);
                              StorageRepository.putList(
                                  'proudctsCount', proudctsCount);
                            },
                            backgroundColor: Colors.redAccent,
                            icon: Icons.delete,
                            label: 'Delete',
                          )
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurpleAccent),
                        height: 100,
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              proudctsPicture[index],
                              fit: BoxFit.contain,
                              height: 120,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proudctsName[index],
                                  style: TextStyle(color: Colors.yellowAccent),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  proudctsPrice[index],
                                  style: TextStyle(color: Colors.yellowAccent),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text('count: ${proudctsCount[index]}'),
                                IconButton(
                                    onPressed: () {
                                      k = int.parse(proudctsCount[index]);
                                      k++;
                                      setState(() {});
                                      proudctsCount[index] = k.toString();
                                    },
                                    icon: Icon(Icons.add)),
                                IconButton(
                                    onPressed: () {
                                      k = int.parse(proudctsCount[index]);
                                      k--;
                                      setState(() {});
                                      proudctsCount[index] = k.toString();
                                    },
                                    icon: Icon(Icons.minimize)),

                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            : null);
  }
}
