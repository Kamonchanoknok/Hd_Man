import 'package:flutter/material.dart';
import 'package:hd_man/widget/TextFix.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  //

  List items = [
    {'name': 'ทีดอท เทสเตอร์', 'exp': 'ช่างไฟฟ้า', 'score': 2.5},
    {'name': 'วายดอท เทสเตอร์', 'exp': 'ช่างคอม', 'score': 4.5},
    {'name': 'บีดอท เทสเตอร์', 'exp': 'ช่างแอร์', 'score': 3.5},
    {'name': 'เจดอท เทสเตอร์', 'exp': 'ช่างรถยนต์', 'score': 1.5}
  ];

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: textFix('ช่างยอดนิยม', null, Colors.white, false),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildUserFavorite(index);
        },
      ),
    );
  }

  Widget _buildUserFavorite(int index) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.redAccent,
                size: 60,
              ),
              title: Row(
                children: <Widget>[
                  textFix(items[index]['name'], 14, null, false),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        textFix(
                            items[index]['score'].toString(), 16, null, false),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
              subtitle: textFix(items[index]['exp'], 12, null, false),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }
}
