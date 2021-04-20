import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/services/network.dart';
import 'package:portfolio/services/util.dart';
import 'package:portfolio/utilities/const.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(
      {this.projectName, this.gitLink, this.projectLink, this.imageURL});
  final String projectName;
  final String gitLink;
  final String projectLink;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child:
                Image(fit: BoxFit.contain, image: NetworkImage(this.imageURL)),
          ),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {
              launchURL(this.projectLink);
            },
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
                  Text(projectName,
                      style: TextStyle(
                          color: Colors.white, fontSize: kFooterIconTextSize)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          MaterialButton(
            onPressed: () {
              launchURL(this.gitLink);
            },
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

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  ProjectResponse r;

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  void getProjects() async {
    var resp = await Portfolio().getProjectReponse();
    setState(() {
      r = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return getUI(r, _width, context);
  }
}

Widget getUI(ProjectResponse r, double screenSize, BuildContext context) {
  while (r == null) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: SpinKitCubeGrid(
        color: Colors.white,
        size: 70.0,
      )),
    );
  }
  return loadedScreen(r, screenSize, context);
}

Container loadedScreen(ProjectResponse r, double _width, BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: Colors.grey),
    child: Scaffold(
      floatingActionButton: getDropDown(context, _width, '/project'),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Text("Recent Projects", style: getProjectDescriptionStyle(_width)),
            Expanded(
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(_width)),
                  children: getCards(r)),
            )
          ],
        ),
      ),
    ),
  );
}

List<ReuseableCard> getCards(ProjectResponse r) {
  List<ReuseableCard> result = [];

  for (var i = 0; i < r.data.length; i++) {
    result.add(ReuseableCard(
      gitLink: r.data[i].gitLink,
      projectName: r.data[i].nameOfProj,
      projectLink: r.data[i].blogLink,
      imageURL: 'https://' + kBaseURL + r.data[i].image,
    ));
  }
  return result;
}
