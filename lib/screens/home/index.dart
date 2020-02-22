import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hd_man/utils/stype.dart';
import 'package:hd_man/widget/TextFix.dart';

import 'package:hd_man/screens/explore/index.dart';
import 'package:hd_man/screens/favorite/index.dart';
import 'package:hd_man/screens/notification/index.dart';
import 'package:hd_man/screens/setting/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  HomeScreen({Key key}) : super(key: key);

  // HomeScreen({Key key, this.data}) : super(key: key);
  // final String data;
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    SettingScreen()
  ];

  BottomNavigationBadge badger = new BottomNavigationBadge(
      backgroundColor: Colors.blueAccent,
      badgeShape: BottomNavigationBadgeShape.circle,
      textColor: Colors.white,
      position: BottomNavigationBadgePosition.topRight,
      textSize: 10);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        title: Text('สำรวจ',
            style: TextStyle(fontFamily: 'ItimRegular', fontSize: 14))),
    BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text(
          'ช่างยอดนิยม',
          style: TextStyle(fontFamily: 'ItimRegular', fontSize: 14),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.inbox),
        title: Text(
          'กล่องข้อความ',
          style: TextStyle(fontFamily: 'ItimRegular', fontSize: 14),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(
          'บัญชี',
          style: TextStyle(fontFamily: 'ItimRegular', fontSize: 14),
        )),
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      items = badger.setBadge(items, "3", 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: _widgetOptions.elementAt(selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
