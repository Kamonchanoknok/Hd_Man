import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hd_man/screens/service/vote.dart';
import 'package:hd_man/widget/TextFix.dart';

class ProcessScreen extends StatefulWidget {
  @override
  _ProcessScreenState createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  List imagesProcess = [
    'lib/assets/images/mokup/step1.png',
    'lib/assets/images/mokup/step2.png',
    'lib/assets/images/mokup/step3.png',
    'lib/assets/images/mokup/step4.png',
    'lib/assets/images/mokup/step5.png',
    'lib/assets/images/mokup/step6.png',
  ];

  List personProcess = [
    'รอร้านรับงาน',
    'ร้านรับออเดอร์ของคุณแล้ว กำลังติดต่อกลับไป',
    'ทำข้อตกลงค่าใช้จ่ายเรียบร้อย',
    'กำลังเดินทางไปหาคุณ',
    'ถึงที่หมายและกำลังให้บริการตามออเดอร์ของลูกค้า',
    'เสร็จสินภาระกิจ',
  ];

  int stateProcess = 0;

  void addStateProcess() {
    setState(() {
      if (stateProcess == 5) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          //Navigator.of(context).pushReplacementNamed('/home');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => VoteScreen()),
          );
        });
      } else {
        stateProcess += 1;
      }
    });
  }

  Widget _buildStatus(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => addStateProcess(),
        child: Card(
          elevation: 5,
          child: ListTile(
            title: textFix('สถานะ : ${title.toString()}', 18, null, true),
          ),
        ),
      ),
    );
  }

  Widget _bulidImagesStauts(data) {
    return Image.asset(
      imagesProcess[stateProcess],
      width: data.width / 2,
    );
  }

  Widget _buildProcess(BuildContext context) {
    final data = MediaQuery.of(context).size;
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _bulidImagesStauts(data),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildProcess(context),
        SizedBox(
          height: 10,
        ),
        _buildStatus(context, personProcess[stateProcess])
      ],
    ));
  }
}
