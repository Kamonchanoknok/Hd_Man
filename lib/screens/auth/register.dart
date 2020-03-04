import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hd_man/widget/TextFix.dart';

class RegisterScrenn extends StatefulWidget {
  @override
  _RegisterScrennState createState() => _RegisterScrennState();
}

class _RegisterScrennState extends State<RegisterScrenn> {
  void navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  Widget _buildFormfield(Label, TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 60.0,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.itim(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: Label,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 5.0),
                prefixIcon: Icon(
                  null,
                ),
                hintText: Label,
                hintStyle: GoogleFonts.itim(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(Function onPressed, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0),
        width: double.infinity,
        child: RaisedButton(
            elevation: 5.0,
            onPressed: onPressed,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.red,
            child: textFix(label, 20, Colors.white, true)),
      ),
    );
  }

  Widget _buildContainerColors() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.yellow[200],
            Colors.yellow[200],
            Colors.yellow[300],
            Colors.yellow[400],
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              _buildContainerColors(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textFix('ข้อมูลผู้ใช้งาน', 25, Colors.redAccent, false)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildFormfield('Email', null),
                    _buildFormfield('รหัสผ่าน', null),
                    _buildFormfield('ยืนยันรหัสผ่าน', null),
                    _buildFormfield('ที่อยู่', null),
                    _buildFormfield('เบอร์โทรติดต่อ', null),
                    _buildButton(
                        () => Navigator.of(context).pop(), 'บันทึกข้อมูล'),
                    _buildButton(() => Navigator.of(context).pop(), 'ย้อนกลับ')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
