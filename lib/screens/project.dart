import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utilities/const.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Projects",
                style: kMyProjectTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              Flex(
                direction: _width > 700 ? Axis.horizontal : Axis.vertical,
                children: [
                  ReuseableCard(),
                  SizedBox(height: kSpaceBetweenProjects),
                  ReuseableCard(),
                  SizedBox(height: kSpaceBetweenProjects),
                  ReuseableCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReuseableCard(),
        SizedBox(height: kSpaceBetweenProjects),
        ReuseableCard(),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ReuseableCard(),
        SizedBox(width: kSpaceBetweenProjects),
        ReuseableCard()
      ],
    );
  }
}

class ReuseableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        children: [
          Image(
            image: AssetImage('images/project4.jpg'),
            height: 200.0,
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 40.0,
            color: Colors.black,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.eye, color: Colors.white),
                Text('  Name of project',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 40.0,
            color: Colors.white,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.github),
                Text('  View on Github')
              ],
            ),
          )
        ],
      ),
    );
  }
}
