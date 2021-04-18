import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utilities/const.dart';

class ReuseableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image(
            fit: BoxFit.contain,
            image: AssetImage('images/project4.jpg'),
          ),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {},
            hoverColor: Colors.grey.withOpacity(0.5),
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 40.0,
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.eye,
                    color: Colors.white,
                    size: 17.0,
                  ),
                  SizedBox(width: 16.0),
                  Text('Name of project',
                      style: TextStyle(
                          color: Colors.white, fontSize: kFooterIconTextSize)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {},
            hoverColor: Colors.grey.withOpacity(0.5),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 40.0,
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.github, size: 17.0),
                  SizedBox(width: 16.0),
                  Text('View on Github',
                      style: TextStyle(fontSize: kFooterIconTextSize))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Scaffold(
        floatingActionButton: getAppBar(_width),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text("Recent Projects",
                  style: getProjectDescriptionStyle(_width)),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(_width)),
                  children: <Widget>[
                    ReuseableCard(),
                    ReuseableCard(),
                    // ReuseableCard(),
                    // ReuseableCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
