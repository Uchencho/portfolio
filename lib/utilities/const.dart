import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const kLinkedInURl = "https://linkedin.com/in/alozie-uche";
const kGithubURl = "https://github.com/Uchencho";
const kTwitterURL = "https://twitter.com/Uchencho_";
const kEmailURL = "mailto:aloziekelechi17@gmail.com";
const kCorsBaseURL = "https://cors.bridged.cc/";

const kFooterIconTextSize = 15.0;
const kDescription =
    "  Software craftman, former beans cooker, work with the best, learning from the best, becoming the best";

const kSpaceBetweenProjects = 20.0;
const kMyProjectTextStyle = TextStyle(color: Colors.yellow, fontSize: 70);

const kBaseURL = 'uchencho.pythonanywhere.com';

Container getAppBar(double _width) {
  return Container(
    margin: EdgeInsets.only(top: 25.0),
    child: TextButton(
      onPressed: () {},
      child: Icon(
        FontAwesomeIcons.bars,
        color: Colors.white,
        size: getIconSize(_width),
      ),
    ),
  );
}

TextStyle getAloziestyle(double screenSize) {
  double fsize;

  if (screenSize >= 700) {
    fsize = 90;
  } else if (screenSize > 500 && screenSize < 700) {
    fsize = 75;
  } else {
    fsize = 55;
  }

  return TextStyle(
      color: Colors.yellow,
      fontSize: fsize,
      fontWeight: FontWeight.bold,
      fontFamily: "Pacifico");
}

TextStyle getUchestyle(double screenSize) {
  double fsize;

  if (screenSize >= 700) {
    fsize = 90;
  } else if (screenSize > 500 && screenSize < 700) {
    fsize = 75;
  } else {
    fsize = 55;
  }

  return TextStyle(
      color: Colors.white,
      fontSize: fsize,
      fontWeight: FontWeight.bold,
      fontFamily: "Pacifico");
}

TextStyle getRoleDescriptonstyle(double screenSize) {
  double fsize;

  if (screenSize >= 700) {
    fsize = 25;
  } else {
    fsize = 19;
  }

  return TextStyle(
      color: Colors.white,
      fontSize: fsize,
      fontWeight: FontWeight.w300,
      fontFamily: "OpenSans");
}

double getIconSize(double screenSize) {
  if (screenSize >= 700) {
    return 25;
  } else {
    return 19;
  }
}

int getCrossAxisCount(double screenSize) {
  if (screenSize >= 1350) {
    return 4;
  } else if (screenSize < 1350 && screenSize > 1050) {
    return 3;
  } else if (screenSize <= 1050 && screenSize > 700) {
    return 2;
  } else {
    return 1;
  }
}

TextStyle getProjectDescriptionStyle(double screenSize) {
  double fsize;

  if (screenSize >= 700) {
    fsize = 90;
  } else if (screenSize > 500 && screenSize < 700) {
    fsize = 75;
  } else {
    fsize = 55;
  }

  return TextStyle(
      color: Colors.white,
      fontSize: fsize,
      fontWeight: FontWeight.w300,
      fontFamily: "OpenSans");
}

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

Container getDropDown(
    BuildContext context, double _width, String currentScreen) {
  return Container(
    margin: EdgeInsets.only(right: 20.0),
    child: DropdownButton<String>(
      items: [
        DropdownMenuItem(child: Text('Home'), value: '/'),
        DropdownMenuItem(child: Text('Projects'), value: '/project'),
        DropdownMenuItem(child: Text('About'), value: '/about'),
        DropdownMenuItem(child: Text('Skills'), value: '/skill'),
      ],
      onChanged: (value) {
        if (value != currentScreen) {
          Navigator.pushNamed(context, value);
        }
      },
      icon: Icon(
        FontAwesomeIcons.bars,
        color: Colors.white,
        size: getIconSize(_width),
      ),
      underline: Container(),
    ),
  );
}

List<Widget> getCurrentSkills() {
  EdgeInsets pad =
      EdgeInsets.only(left: 8.0, right: 8.0, top: 1.0, bottom: 1.0);
  double h = 35.0;
  List<Widget> result = [
    Padding(
      padding: pad,
      child: Text("Current skills >>>", style: TextStyle(color: Colors.white)),
    ),
    Padding(
        padding: pad,
        child: Image(image: AssetImage("images/icons/golang.jpeg"), height: h)),
    Padding(
        padding: pad,
        child: Image(
            image: AssetImage("images/icons/python_logo.png"), height: h)),
    Padding(
        padding: pad,
        child: Image(
            image: AssetImage("images/icons/aws_cloudformation.png"),
            height: h)),
    Padding(
        padding: pad,
        child:
            Image(image: AssetImage("images/icons/aws_dynamo.png"), height: h)),
    Padding(
        padding: pad,
        child:
            Image(image: AssetImage("images/icons/aws_lambda.png"), height: h)),
    Padding(
        padding: pad,
        child: Image(
            image: AssetImage("images/icons/heroku_icon.png"), height: h)),
    Padding(
        padding: pad,
        child: Image(
            image: AssetImage("images/icons/flutter_icon.png"), height: h)),
  ];
  return result;
}
