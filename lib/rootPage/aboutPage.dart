import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myresweb/rootPage/colorPallet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expansion_card/expansion_card.dart';

class About extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: media * 0.08, left: media * 0.09, right: media * 0.09),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " It's About...",
                      style: TextStyle(
                        color: myMaterialTeal,
                        fontSize: media * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: media * 0.06,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CarouselSlider(
                          carouselController: buttonCarouselController,
                            items: projectList,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              viewportFraction: 0.18,
                              height: media * 0.3,
                            )),
                        IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white,),onPressed: (){buttonCarouselController.nextPage(duration: Duration(seconds: 1));}),
                      ],
                    ),
                    SizedBox(
                      height: media * 0.06,
                    ),
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        "Hi.",
                        style: TextStyle(
                            color: myMaterialRed,
                            fontWeight: FontWeight.w800,
                            fontSize: media * 0.05),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(media * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCard(
                              title: "Who's this guy?",
                              bodyTitle: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I'm a mobile/web application developer and an AI enthusiast based in New-Delhi, India.",
                                    style: TextStyle(fontSize: media * 0.025),
                                  ),
                                  Text(
                                    "I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences for web and mobile devices.",
                                    style: TextStyle(fontSize: media * 0.025),
                                  ),
                                  Text(
                                    "I aim on building excellent software that improves the lives of those around me.",
                                    style: TextStyle(fontSize: media * 0.025),
                                  ),
                                  Text(
                                    "Let's make something special.",
                                    style: TextStyle(fontSize: media * 0.025),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: media * 0.02,
                          ),
                          MyCard(
                            title: "What I can do.",
                            bodyTitle: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Design what you want.",
                                  style: TextStyle(
                                      color: myMaterialTeal,
                                      fontSize: media * 0.035),
                                ),
                                Text(
                                  "I like to keep it simple. My goals are to focus on typography, content and conveying the message that you want to send.",
                                  style: TextStyle(fontSize: media * 0.025),
                                ),
                                Text(
                                  "Develop what you need.",
                                  style: TextStyle(
                                      color: myMaterialRed,
                                      fontSize: media * 0.035),
                                ),
                                Text(
                                  "I'm a developer, so I know how to create your website/mobile app to run across devices using the latest technologies available.",
                                  style: TextStyle(fontSize: media * 0.025),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: media * 0.02,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(

                          onTap: () {
                            launch("https://github.com/utsavdutta?tab=repositories");
                          },
                          child: Container(
                            height: media * 0.06 ,
                            width:  media * 0.24,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(right: BorderSide(width: 2,color: Colors.white),left: BorderSide(width: 2,color: Colors.white),top: BorderSide(width: 2,color: Colors.white),bottom: BorderSide(width: 2,color: Colors.white))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Feather.github),
                                SizedBox(width: media * 0.01,),
                                Text(
                                  "Browse My Projects.",
                                  style: TextStyle(fontSize: media * 0.02),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(

                          onTap: () {
                            _launchURL();
                          },
                          child: Container(
                            height: media * 0.06 ,
                            width:  media * 0.22,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(right: BorderSide(width: 2,color: Colors.white),left: BorderSide(width: 2,color: Colors.white),top: BorderSide(width: 2,color: Colors.white),bottom: BorderSide(width: 2,color: Colors.white))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FontAwesome.paper_plane),
                                SizedBox(width: media * 0.02,),
                                Text(
                                  "Get In Touch.",
                                  style: TextStyle(fontSize: media * 0.02),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media * 0.1,
                    ),
                  ]),
            ),
          );
        }

        return SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media * 0.01,
              ),
              CarouselSlider(
                  items: projectList,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    height: MediaQuery.of(context).size.height * 0.3,
                  )),
              SizedBox(
                height: media * 0.02,
              ),
              Column(
                children: [
                  ExpansionCard(
                    title: Material(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                           Radius.circular(6))),
                  color: Colors.transparent,
                  child: Container(
                    height: media * 0.1,
                    width: media * 0.6,
                    decoration: BoxDecoration(
                      color: myMaterialPurpleP,
                    ),
                    child: Center(
                      child: Text(
                        "Who's This Guy?",
                        style: TextStyle(
                          fontSize: media * 0.036,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                    ),
                    children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(media * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "I'm a mobile/web application developer and an AI enthusiast based in New-Delhi, India.",
                          style: TextStyle(fontSize: media * 0.025),
                        ),
                        Text(
                          "I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences for web and mobile devices.",
                          style: TextStyle(fontSize: media * 0.025),
                        ),
                        Text(
                          "I aim on building excellent software that improves the lives of those around me.",
                          style: TextStyle(fontSize: media * 0.025),
                        ),
                        Text(
                          "Let's make something special.",
                          style: TextStyle(fontSize: media * 0.025),
                        ),
                      ],
                    ),
                  )
                    ],
                  ),
                  SizedBox(
                    height: media * 0.01,
                  ),
                  Center(
                      child: ExpansionCard(
                    title:  Material(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(6))),
                      color: Colors.transparent,
                      child: Container(
                        height: media * 0.1,
                        width: media * 0.6,
                        decoration: BoxDecoration(
                          color: myMaterialPurpleP,
                        ),
                        child: Center(
                          child: Text(
                            "What I Can Do",
                            style: TextStyle(
                              fontSize: media * 0.036,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Design what you want.",
                              style: TextStyle(
                                  color: myMaterialTeal,
                                  fontSize: media * 0.035),
                            ),
                            Text(
                              "I like to keep it simple. My goals are to focus on typography, content and conveying the message that you want to send.",
                              style: TextStyle(fontSize: media * 0.025),
                            ),
                            Text(
                              "Develop what you need.",
                              style: TextStyle(
                                  color: myMaterialRed,
                                  fontSize: media * 0.035),
                            ),
                            Text(
                              "I'm a developer, so I know how to create your website/mobile app to run across devices using the latest technologies available.",
                              style: TextStyle(fontSize: media * 0.025),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(media * 0.02),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: media * 0.06,
              ),
              InkWell(

                onTap: () {
                  launch("https://github.com/utsavdutta?tab=repositories");
                },
                child: Container(
                  height: media * 0.06 ,
                  width:  media * 0.24,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(right: BorderSide(width: 2,color: Colors.white),left: BorderSide(width: 2,color: Colors.white),top: BorderSide(width: 2,color: Colors.white),bottom: BorderSide(width: 2,color: Colors.white))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Feather.github),
                      SizedBox(width: media * 0.01,),
                      Text(
                        "Browse My Projects.",
                        style: TextStyle(fontSize: media * 0.02),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: media * 0.02,
              ),
              InkWell(

                onTap: () {
                  _launchURL();
                },
                child: Container(
                  height: media * 0.06 ,
                  width:  media * 0.22,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(right: BorderSide(width: 2,color: Colors.white),left: BorderSide(width: 2,color: Colors.white),top: BorderSide(width: 2,color: Colors.white),bottom: BorderSide(width: 2,color: Colors.white))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesome.paper_plane),
                      SizedBox(width: media * 0.02,),
                      Text(
                        "Get In Touch.",
                        style: TextStyle(fontSize: media * 0.02),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final List<Widget> projectList = [
  AboutCard(
    colour2: g2,
    colour3: Colors.white,
    colour1: g,
    icon: MaterialCommunityIcons.responsive,
    aboutCardTitle: "Responsive",
    data: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextFit(
          colour: Colors.white,
          textfield: "My layouts will work",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "on any",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "device, big or small.",
          size: 0.03,
        ),
      ],
    ),
  ),
  AboutCard(
    colour2: blue,
    colour3: Colors.white,
    colour1: blue2,
    aboutCardTitle: 'Fast',
    icon: SimpleLineIcons.speedometer,
    data: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextFit(
          colour: Colors.white,
          textfield: "Fast load times",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "and",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "lag free interaction.",
          size: 0.03,
        ),
      ],
    ),
  ),
  AboutCard(
    colour2: bl2,
    colour3: Colors.white  ,
    colour1: bl,
    icon: MaterialCommunityIcons.rocket,
    aboutCardTitle: "Dynamic",
    data: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextFit(
          textfield: "Websites don't have to",
          size: 0.03,
          colour: Colors.white,
        ),
        MyTextFit(
          textfield: "be static.I love making ",
          size: 0.03,
          colour: Colors.white,
        ),
        MyTextFit(
          textfield: "pages come to life.",
          size: 0.03,
          colour: Colors.white,
        ),
      ],
    ),
  ),
  AboutCard(
    colour2: r2,
      colour3: Colors.white,
    colour1: r,
    icon: MaterialCommunityIcons.lightbulb_on,
    aboutCardTitle: "Intutive",
    data: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextFit(
          colour: Colors.white,
          textfield: "Strong preference for",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "easy to use,",
          size: 0.03,
        ),
        MyTextFit(
          colour: Colors.white,
          textfield: "intuitive UX/UI.",
          size: 0.03,
        ),
      ],
    ),
  ),

];

class MyTextFit extends StatelessWidget {
  MyTextFit({this.textfield, this.size, this.colour});

  final String textfield;
  final double size;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        '$textfield',
        style: TextStyle(
          color: colour,
          fontSize: media * size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.bodyTitle});
  final String title;
  final Widget bodyTitle;

  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        children: <Widget>[
          Material(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6), topLeft: Radius.circular(6))),
            color: Colors.transparent,
            elevation: 4,
            child: Container(
              height: media * 0.1,
              width: media * 0.6,
              decoration: BoxDecoration(
                color: myMaterialPurpleP,
              ),
              child: Center(
                child: Text(
                  "$title",
                  style: TextStyle(
                    fontSize: media * 0.036,
                    color: mywhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: media * 0.002,
          ),
          Material(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            color: Colors.transparent,
            elevation: 4,
            child: Container(
                height: media * 0.5,
                width: media * 0.6,
                decoration: BoxDecoration(
                  color: myMaterialPurplePb,
                ),
                child: Padding(
                    padding: EdgeInsets.all(media * 0.05), child: bodyTitle)),
          ),
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final String aboutCardTitle;
  final Color colour1;
  final Color colour2;
  final Color colour3;
  final IconData icon;
  final Column data;

  AboutCard(
      {this.aboutCardTitle,
      this.data,
      this.colour1,
      this.colour2,
      this.colour3,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;

    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Card(
        child: Material(
          color: Colors.transparent,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
          elevation: 4,
          child: Container(
            height: media * 0.25,
            width: media * 0.4,
            color: colour1,
            child: Padding(
              padding: EdgeInsets.all(media * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: media * 0.08,
                    backgroundColor: colour2,
                    child: Icon(icon, size: media * 0.14, color: colour3),
                  ),
                  Text(
                    '$aboutCardTitle',
                    style: TextStyle(fontSize: media * 0.03, color: colour3),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      back: Card(
        child: Material(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
          elevation: 4,
          child: Container(
            color: colour1,
            height: media * 0.25,
            width: media * 0.4,
            child: Padding(padding: EdgeInsets.all(media * 0.01), child: data),
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = "mailto:utsavdutta08@gmail.com?subject=News&body=New%20plugin";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}