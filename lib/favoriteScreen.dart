import 'package:flutter/material.dart';
import 'package:test3/HomeScreen.dart';
import 'model/itemModel.dart';

class FavoriteScreen extends StatefulWidget {
  List<ItemModel> items = [];
  FavoriteScreen(this.items);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(widget.items[index].ID),
                        ));
                  },
                  child: ListTile(
                    title: Text('${widget.items[index].title}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),

                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
