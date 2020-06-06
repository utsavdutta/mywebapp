import 'package:flutter/material.dart';
import 'package:myresweb/rootPage/aboutPage.dart';
import 'package:myresweb/rootPage/contactPages.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:myresweb/rootPage/homepage.dart';
import 'rootPage/colorPallet.dart';
void main() {
  runApp(MyWebApp());
}

class MyWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Find Utsav',
      home: ScreenTypeLayout.builder(
          desktop: (BuildContext context) => DesktopLayout(),
          mobile: (BuildContext context) => MobileLayout()),
    );
  }
}


class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myBlack,
      body: Column(
        children: [
          Container(
            height: media * 0.17,
            padding: EdgeInsets.all(media * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ᚢᛞ",style: TextStyle(
                  fontSize: media * 0.04,color: Color(0xFFB4B4B4),fontWeight: FontWeight.bold
                ),),
                Text("  Making The Complex Simple",style: TextStyle(
                    fontSize: media * 0.024,color: Color(0xFFE6E6E6),textBaseline: TextBaseline.alphabetic
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
            decoration: BoxDecoration(
            color: myPurple,
      borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
      topLeft: Radius.circular(40),
            )),child: PageViewC(),
          ))
        ],
      ),
    );
  }
}


class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: myMaterialPurplePb),
      backgroundColor: myPurple,
      body: PageViewC(),
    );
  }
}


class PageViewC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Home(),
        About(),
        Contacts(),
      ],
    );
  }
}






