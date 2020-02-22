import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hd_man/widget/TextFix.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
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
          color: Colors.redAccent,
          child: textFix('ส่ง', 20, Colors.white, true)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: data.width / 4,
            ),
            textFix('ร้าน Tdot.com', 30, null, true),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFix(
                  'ได้รับการบริการแล้วใช่ไหม ? โปรดให้คะแนนการบริการกับร้านนี้ ความคิดเห็นของคุณสำคัญกับเรามาก',
                  16,
                  Colors.black87,
                  false),
            ),
            RatingBar(
              initialRating: 1.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildButton(
                  () => Navigator.of(context).pushReplacementNamed('/home')),
            )
          ],
        ),
      ),
    );
  }
}
