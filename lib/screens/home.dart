import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/screens/const.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          body: Container(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Uchenna", style: kUcheTextStyle),
                      Expanded(child: Text(" Alozie", style: kAlozieTextStyle))
                    ],
                  ),
                  Container(
                      color: Colors.grey.shade800,
                      width: 5000,
                      margin: EdgeInsets.only(right: 30.0),
                      child: Text(kDescription, style: kRoleDescription)),
                  SizedBox(height: 20),
                  Container(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(FontAwesomeIcons.twitter,
                            color: Colors.white, size: kIconSize),
                        Icon(FontAwesomeIcons.linkedin,
                            color: Colors.white, size: kIconSize),
                        Icon(FontAwesomeIcons.github,
                            color: Colors.white, size: kIconSize),
                        Icon(FontAwesomeIcons.envelope,
                            color: Colors.white, size: kIconSize)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
