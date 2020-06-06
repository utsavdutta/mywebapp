import 'package:flutter/material.dart';
import 'package:myresweb/rootPage/colorPallet.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';


class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AvatarGlow(
            startDelay: Duration(milliseconds: 1000),
            glowColor: myMaterialTeal,
            endRadius: media * 0.18,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
                color: Colors.transparent,
                elevation: 8.0,
                child: Container(
                    height: media * 0.24,
                    width: media * 0.2,
                    child: Image.asset(
                      'assets/pic.jpg',
                      fit: BoxFit.cover,
                    ))),
            shape: BoxShape.rectangle,
            curve: Curves.decelerate,
          ),
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "OK, LET’S CREATE SOMETHING GREAT",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: myMaterialTeal,
                fontSize: 25.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
              color: myMaterialPurpleP,
              margin: EdgeInsets.only(
                  top: media * 0.03,
                  left: media * 0.06,
                  right: media * 0.06),
              child: InkWell(
                onTap: () {},
                hoverColor: myMaterialPurplePb,
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: myMaterialRed,
                  ),
                  title: Text(
                    'New Delhi, INDIA',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: mywhite,
                        fontFamily: 'Source Sans Pro'),
                  ),
                ),
              )),
          Card(
              color: myMaterialPurpleP,
              margin: EdgeInsets.only(
                  top: media * 0.02,
                  left: media * 0.06,
                  right: media * 0.06),
              child: InkWell(
                hoverColor: myMaterialPurplePb,
                onTap: () {
                  launch("tel:+91 8810565498");
                },
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: myMaterialRed,
                  ),
                  title: Text(
                    '+91 8810565498',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: mywhite,
                        fontFamily: 'Source Sans Pro'),
                  ),
                ),
              )),
          Card(
              color: myMaterialPurpleP,
              margin: EdgeInsets.only(
                  top: media * 0.02,
                  left: media * 0.06,
                  right: media * 0.06),
              child: InkWell(
                hoverColor: myMaterialPurplePb,
                onTap: () { _launchURL();  },
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: myMaterialRed,
                  ),
                  title: Text(
                    'utsavdutta08@gmail.com',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: mywhite,
                        fontFamily: 'Source Sans Pro'),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(media * 0.02),
            child: ResponsiveBuilder(builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return SocialButton();
              }
              return SocialButton();
            }),
          ),
          SizedBox(
            height: media * 0.02,
          ),
          Text(
            "© 2020 Utsav Dutta. All rights reserved.",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double media = MediaQuery.of(context).size.height;
    return RaisedButton(
      color: myPurpleButton,
      child: Text(
        "Let's get social",
        style: TextStyle(fontSize: media * 0.03),
      ),
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                ),
                height: media * 0.18,
                child: SizedBox(
                    child: Card(
                  color: myPurpleButton3,
                  borderOnForeground: true,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FacebookButton(
                          onPressed: () {
                            launch(
                                "https://www.facebook.com/angelwithash0tgun");
                          },
                        ),
                        TwitterButton(
                          onPressed: () {
                            launch("https://twitter.com/darkside6lues");
                          },
                        ),
                        GithubButton(
                          onPressed: () {
                            launch("https://github.com/utsavdutta");
                          },
                        ),
                        InstagramButton(
                          onPressed: () {
                            launch("https://www.instagram.com/darkside6lues");
                          },
                        ),
                        LinkedinButton(
                          onPressed: () {
                            launch("https://www.linkedin.com/in/utsav-dutta");
                          },
                        ),
                      ],
                    ),
                  ),
                )),
              );
            });
      },
      textColor: mywhite,
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
