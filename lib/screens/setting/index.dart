import 'package:flutter/material.dart';
import 'package:hd_man/widget/TextFix.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List items = [
    {'title': 'การตั้งค่า'},
    {'title': 'คู่มือการใช้งาน'},
    {'title': 'เกี่ยวกับ Handy Man'},
  ];

  Widget _buildListView() {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListTitles(index);
      },
      separatorBuilder: (context, index) {
        return Divider(
          endIndent: 20,
          indent: 20,
        );
      },
    );
  }

  Widget _buildListTitles(int index) {
    return ListTile(
      title: textFix(items[index]['title'], 14, null, false),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => {},
    );
  }

  Widget _buildProfile() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 90,
              color: Colors.redAccent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  textFix('Nokdot', 20, null, true),
                  Row(
                    children: <Widget>[
                      textFix('แก้ไขข้อมูล', 14, null, false),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: _buildProfile(),
          onTap: () {
            print('test !');
          },
        ),
        Expanded(
          child: _buildListView(),
        )
      ],
    );
  }
}
