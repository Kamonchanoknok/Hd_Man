import 'package:flutter/material.dart';
import 'package:hd_man/screens/service/process.dart';
import 'package:hd_man/widget/TextFix.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  //

  List items = [
    {'title': 'ทำความสะอาด 1 ชั่วโมง', 'price': 450, 'status': 0},
    {'title': 'ทำความสะอาด 3 ชั่วโมง', 'price': 500, 'status': 0},
    {'title': 'ทำความสะอาด 4 ชั่วโมง', 'price': 550, 'status': 0},
    {'title': 'ทำความสะอาด 6 ชั่วโมง', 'price': 650, 'status': 0},
  ];

  int countJob = 0;
  int priceJob = 0;

  void navigationToProcess(BuildContext context) {
    if (countJob > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProcessScreen()),
      );
    }
  }

  Widget _buildUserFavorite(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (items[index]['status'] == 1) {
            items[index]['status'] = 0;
            priceJob = priceJob - items[index]['price'];
            countJob--;
          } else {
            items[index]['status'] = 1;
            priceJob = priceJob + items[index]['price'];
            countJob++;
          }
        });
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.settings_applications,
                  color: Colors.redAccent,
                  size: 40,
                ),
                title: textFix(items[index]['title'], 14, null, true),
                subtitle:
                    textFix('฿ ${items[index]['price']} / คน', 12, null, false),
                trailing: Icon(
                  Icons.favorite,
                  color: items[index]['status'] != 0 ? Colors.red : null,
                ),
              ),
            ],
          ),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        centerTitle: true,
        title: textFix('เลือกรายการ', null, Colors.white, false),
      ),
      body: _buildListView(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => navigationToProcess(context),
          child: Card(
            elevation: 5,
            child: Container(
              height: data.height / 9.5,
              child: ListTile(
                title: textFix('เลือกทั้งหมด ${countJob.toString()} รายการ', 17,
                    null, false),
                subtitle:
                    textFix('฿ ${priceJob.toString()} บาท', 14, null, false),
                trailing: Icon(
                  Icons.verified_user,
                  color: countJob > 0 ? Colors.green : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
