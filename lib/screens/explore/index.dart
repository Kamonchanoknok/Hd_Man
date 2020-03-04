import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hd_man/screens/service/index.dart';
import 'package:hd_man/widget/TextFix.dart';
import 'package:hd_man/utils/stype.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //
  int setlist_promotion = 0;

  String userName = "Nok Tester";
  List ListPromotion = [
    {'image': 'tester01.png'},
  ];

  List ListPerson = [
    {'image': 'tester02.jpg'},
    {'image': 'tester02.jpg'},
    {'image': 'tester02.jpg'},
    {'image': 'tester02.jpg'},
  ];

  void navigationToService(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceScreen()),
    );

//    Navigator.push(
//        context,
//        PageRouteBuilder(
//            pageBuilder: (BuildContext context, Animation<double> animation,
//                Animation<double> secondaryAnimation) {
//              return ServiceScreen();
//            },
//            transitionsBuilder: (BuildContext context,
//                Animation<double> animation,
//                Animation<double> secondaryAnimation,
//                Widget child) {
//              return SlideTransition(
//                position: Tween<Offset>(
//                  begin: Offset(-1.0, 0.0),
//                  end: Offset(0.0, 0.0),
//                ).animate(animation),
//                child: child,
//              );
//            },
//            transitionDuration: Duration(seconds: 3)));
  }

  TextEditingController _searchController = TextEditingController();

  Widget _bulidHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Center(
        child: Container(
          child: textFix('สวัสดีคุณ ${userName.toString()}', 14, null, true),
        ),
      ),
    );
  }

  Widget _bulidSearchBox() {
    return TextField(
      controller: _searchController,
      style: GoogleFonts.chakraPetch(color: Colors.black),
      decoration: InputDecoration(
        labelText: "ค้นหาบริการของคุณ",
        hintText: "ค้นหาบริการของคุณ",
        hintStyle: GoogleFonts.chakraPetch(),
        prefixIcon: Icon(Icons.search),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : InkWell(
                onTap: () => _searchController.clear(),
                child: Icon(Icons.clear),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildBannerPromotion(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          CarouselSlider.builder(
            height: 185,
            //enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            itemCount: ListPromotion.length,
            //reverse: true,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            enlargeCenterPage: true,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //decoration: BoxDecoration(color: Colors.amber),
                  child: Image.asset('lib/assets/images/mokup/tester01.png'));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBannerService(BuildContext context) {
    final data = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        CarouselSlider.builder(
          height: 200,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          itemCount: ListPerson.length,
          reverse: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: false,
          itemBuilder: (BuildContext context, int i) {
            return Container(
                width: data.size.width / 1.5,
                //decoration: BoxDecoration(color: Colors.amber),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => navigationToService(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Image.asset(
                              'lib/assets/images/mokup/tester02.jpg',
                              height: data.size.height / 6,
                              width: data.size.width,
                            ),
                          ),
                          elevation: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        textFix('ร้าน Nokdot.com', 18, null, true),
                        textFix('บริการ ซ่อมคอมพิวเตอร์', 16, null, false)
                      ],
                    ),
                  ),
                ));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _bulidHeaderProfile(),
              SizedBox(
                height: 15,
              ),
              _bulidSearchBox(),
              SizedBox(
                height: 15,
              ),
              textFix('โปรโมชั่น', 20, Colors.red, true),
              _buildBannerPromotion(context),
              textFix('บริการยอดฮิต', 20, Colors.red, true),
              _buildBannerService(context)
            ],
          ),
        ),
      ),
    );
  }
}
