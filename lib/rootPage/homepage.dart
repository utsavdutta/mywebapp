import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myresweb/rootPage/colorPallet.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  List<String> _arrJobTitle = [
    "Mobile App Developer",
    "Web App Developer",
    "UI/UX Designer",
    "Freelancer"
  ];

  int _currentJobPos = 0;

  Timer _timer;

  void _startTimer() {
    const oneSec = const Duration(seconds: 3);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_currentJobPos < _arrJobTitle.length - 1) {
            _currentJobPos++;
          } else {
            _currentJobPos = 0;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    final double mediaW = MediaQuery.of(context).size.width;

    return AnimatedBackground(
      vsync: this,
      behaviour: BubblesBehaviour(),
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          color: Colors.transparent,
          width: mediaW,
          height: media,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Hello World!",
                    style: TextStyle(
                      color: mywhite,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        fontFamily: "GoogleSans",
                       )),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                  text: TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(color: mywhite,
                          fontSize: 50,
                          fontFamily: "GoogleSans",
                          ),
                      children: [
                        TextSpan(
                            text: "My home page",
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.bold,
                                color: myMaterialTeal))
                      ]),
                ),
              ),
              SizedBox(height: media *0.04,),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                  text: TextSpan(
                      text: "I am a ",
                      style: TextStyle(
                        color: mywhite,
                          fontSize: 25,
                          fontFamily: "GoogleSans",
                          ),
                      children: [
                        TextSpan(
                            text: " ${_arrJobTitle[_currentJobPos]}",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "GoogleSans",
                                fontWeight: FontWeight.bold,
                                color: myMaterialRed))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
