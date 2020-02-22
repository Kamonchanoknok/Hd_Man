import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hd_man/screens/auth/register.dart';
import 'package:hd_man/widget/TextFix.dart';

class OtpScreens extends StatelessWidget {
  void navigateTo(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return RegisterScrenn();
    }));
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

  Widget _buildButton(Function onPressed, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: onPressed,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: textFix(label, 20, Colors.red, true)),
    );
  }

  final kBoxDecorationStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  Widget _buildTextFieldFix() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            style: GoogleFonts.itim(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.notifications,
              ),
              hintText: 'กรุณากรอกรหัส OTP',
              hintStyle: GoogleFonts.itim(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () => {},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'หากยังไม่ได้รับรหัส OTP ',
              style: GoogleFonts.itim(
                color: Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'คลิก',
              style: GoogleFonts.itim(
                color: Colors.redAccent,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerForm(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textFix('ระบบได้ทำส่งรหัส OTP ไปยังอีเมลล์', 22, Colors.redAccent,
                true),
            SizedBox(
              height: 10,
            ),
            textFix('test@gmail.com', 20, Colors.redAccent, false),
            SizedBox(
              height: 15,
            ),
            _buildTextFieldFix(),
            _buildButton(() => navigateTo(context), 'ยืนยันตัวตน'),
            _buildSignInBtn(),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            _buildContainerColors(),
            _buildContainerForm(context)
          ],
        ),
      ),
    );
  }
}
