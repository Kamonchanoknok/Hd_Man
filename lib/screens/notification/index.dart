import 'package:flutter/material.dart';
import 'package:hd_man/widget/TextFix.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List items = [
    {'title': 'ติดต่อใช้บริการ ซ่อมแอร์', 'subtitle': 'ลูกค้าออเดอร์ 12444'},
    {'title': 'ติดต่อใช้บริการ ซ่อมแอร์', 'subtitle': 'ลูกค้าออเดอร์ 12445'},
    {'title': 'ติดต่อใช้บริการ ล้างแอร์', 'subtitle': 'ลูกค้าออเดอร์ 12446'},
  ];

  Widget _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCards(index);
      },
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            textFix('ลบ', 15, Colors.white, false),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget _buildCards(int index) {
    return GestureDetector(
      onTap: () {
        print("items => ${index.toString()}");
      },
      child: Container(
        child: Dismissible(
          background: slideLeftBackground(),
          // ignore: missing_return
          confirmDismiss: (DismissDirection direction) async {},
          direction: DismissDirection.endToStart,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    elevation: 0,
                    child: Icon(
                      Icons.local_post_office,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                title: textFix(items[index]['title'], 12, null, true),
                subtitle: textFix(items[index]['subtitle'], 10, null, false),
              ),
              index != items.length - 1
                  ? Divider(
                      endIndent: 20,
                      indent: 20,
                    )
                  : Container()
            ],
          ),
          key: Key(index.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: textFix('กล่องข้อความ', null, Colors.white, false),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: _buildListView(),
          ),
        ));
  }
}
