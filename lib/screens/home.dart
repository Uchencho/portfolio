import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/utilities/const.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF686868),
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.copyright,
                size: kFooterIconTextSize,
                color: Colors.white,
              ),
              Text(
                ' Uchencho',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: kFooterIconTextSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 25.0),
          child: getDropDown(context, _width, '/'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Container(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign:
                            _width > 700 ? TextAlign.start : TextAlign.center,
                        softWrap: true,
                        maxLines: 3,
                        text: TextSpan(
                          text: "Uchenna",
                          style: getUchestyle(_width),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Alozie", style: getAloziestyle(_width))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Color(0xFF686868),
                  width: 5000,
                  child: Text(
                    kDescription,
                    style: getRoleDescriptonstyle(_width),
                    textAlign:
                        _width > 700 ? TextAlign.start : TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: _width > 700
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        ic: FontAwesomeIcons.twitter,
                        hoverColor: Colors.blue,
                        url: kTwitterURL,
                        screenSize: _width,
                      ),
                      CustomIcon(
                        ic: FontAwesomeIcons.linkedin,
                        hoverColor: Colors.blue,
                        url: kLinkedInURl,
                        screenSize: _width,
                      ),
                      CustomIcon(
                        ic: FontAwesomeIcons.github,
                        hoverColor: Colors.black,
                        url: kGithubURl,
                        screenSize: _width,
                      ),
                      CustomIcon(
                        ic: FontAwesomeIcons.envelope,
                        hoverColor: Colors.red,
                        url: kEmailURL,
                        screenSize: _width,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  CustomIcon(
      {@required this.ic,
      @required this.hoverColor,
      @required this.url,
      @required this.screenSize});
  final IconData ic;
  final Color hoverColor;
  final String url;
  final double screenSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        launchURL(this.url);
      },
      hoverColor: this.hoverColor,
      splashRadius: 20.0,
      icon: Icon(this.ic, color: Colors.white, size: getIconSize(screenSize)),
    );
  }
}

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
