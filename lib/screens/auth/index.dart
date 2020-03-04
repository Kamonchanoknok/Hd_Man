import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hd_man/screens/auth/register.dart';
import 'package:hd_man/utils/stype.dart';

import 'package:hd_man/widget/TextFix.dart';
//import 'package:hd_man/screens/auth/otp.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void navigateTo(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return RegisterScrenn();
    }));
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
              child: Divider(
            color: Colors.red,
            endIndent: 10,
            indent: 5,
          )),
          textFix("หรือ", 22, Colors.red, true),
          Expanded(
              child: Divider(
            color: Colors.red,
            endIndent: 5,
            indent: 10,
          )),
        ]),
        SizedBox(height: 5),
        textFix("เข้าสู่ระบบด้วย", 20, Colors.red, false),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(Function onPressed) {
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
          child: textFix('เข้าสู่ระบบ', 20, Colors.red, true)),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.chakraPetch(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
              ),
              hintText: 'กรุณากรอกอีเมลล์',
              hintStyle: GoogleFonts.chakraPetch(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.chakraPetch(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
              ),
              hintText: 'กรุณากรอกรหัสผ่าน',
              hintStyle: GoogleFonts.chakraPetch(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInBtn(Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'หากยังไม่ได้เป็นสมัครชิก ',
                style: fontStyles(16.0, Colors.redAccent, false)),
            TextSpan(
                text: 'คลิก', style: fontStyles(16.0, Colors.redAccent, true)),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'lib/assets/icons/facebook.png',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'lib/assets/icons/google.png',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
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
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Handy Man',
                          style: fontStyles(40, Colors.red, true),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildPasswordTF(),
                        _buildButton(() => navigateToHome()),
                        _buildSignInBtn(() => navigateTo(context)),
                        SizedBox(
                          height: 10,
                        ),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
