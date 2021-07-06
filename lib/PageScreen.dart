import 'package:flutter/material.dart';
import 'package:test3/HomeScreen.dart';
import 'package:test3/favoriteScreen.dart';
import 'package:test3/model/itemModel.dart';

class PageScreen extends StatefulWidget {
  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  List<ItemModel> items = [];
  @override
  Widget build(BuildContext context) {
    // var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('CSS tutorial',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          actions: [
            Row(
              children: [
                Text(items.length.toString()),
                IconButton(
                    icon: Icon(
                      Icons.favorite_outlined,
                      size: 25,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoriteScreen(items),
                          ));
                    })
              ],
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(index),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${listData[index].title}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  listData[index].selected =
                                      !listData[index].selected;
                                  if (listData[index].selected) {
                                    items.add(listData[index]);
                                  } else {
                                    items.remove(listData[index]);
                                  }
                                });
                              },
                              child: Icon(Icons.star,
                                  color: listData[index].selected == true
                                      ? Colors.red
                                      : Colors.grey))
                        ],
                      ),
                    )),
                  ),
                ),
              );
            },
          ),
        ));
  }
}


