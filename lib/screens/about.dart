import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utilities/const.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 25.0),
          child: getDropDown(context, _width, '/about'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Center(
          child: Column(
            children: <Widget>[
              Header(),
              Expanded(
                child: _TimelineActivity(steps: generateData()),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

List<Step> generateData() {
  return <Step>[
    Step(
      type: Type.checkpoint,
      icon: Icons.home,
      message: 'Esusu Inc. New York, USA',
      duration: 2,
      color: const Color(0xFFF2F2F2),
    ),
    Step(
      type: Type.line,
      hour: 'Present',
      message:
          'Software engineer writing scalable backend code with a microservice architecture using most of AWS services.\n\nTechnology Used:\nGolang\nPython\nAWS Lambda\nDynamoDB and MongoDB\nAWS Cloudformation\nAWS Codepipeline',
      duration: 9,
      color: Colors.white,
    ),
    Step(
      type: Type.checkpoint,
      icon: Icons.work,
      hour: 'Oct 2020',
      message: 'Coronation Insurance. Lagos, Nigeria',
      duration: 2,
      color: const Color(0xFFF2F2F2),
    ),
    Step(
      type: Type.line,
      hour: 'May 2021',
      message:
          'Data Analyst who built a pipeline for automating data ingestion and reporting\n\nTechnology Used:\nPython\nGit\nMS-SQL\nPowerBI',
      duration: 8,
      color: Colors.yellow,
    ),
    Step(
      type: Type.checkpoint,
      icon: FontAwesomeIcons.fire,
      hour: 'Jan 2020',
      message: 'Choice International. Lagos Nigeria',
      duration: 2,
      color: Colors.white,
    ),
    Step(
      type: Type.line,
      hour: 'Jan 2020',
      message:
          'Data Analyst who generated weekly, monthly, quarterly and annual business reports\n\nTechnology Used:\nPython\nExcel',
      duration: 8,
      color: Colors.white,
    ),
    Step(
      type: Type.checkpoint,
      icon: Icons.work,
      hour: 'May 2019',
      message: 'OperaPay (OPay). Lagos Nigeria',
      duration: 2,
      color: const Color(0xFFF2F2F2),
    ),
    Step(
      type: Type.line,
      hour: 'May 2019',
      message: '',
      duration: 3,
      color: Colors.yellow,
    ),
    Step(
        type: Type.line,
        hour: '',
        message: 'Learnt a lot during this internship',
        duration: 14,
        color: Colors.yellow),
    Step(
        type: Type.line,
        hour: 'Oct 2018',
        message: '',
        duration: 14,
        color: Colors.yellow)
  ];
}

enum Type {
  checkpoint,
  line,
}

class Step {
  Step({
    this.type,
    this.hour,
    this.message,
    this.duration,
    this.color,
    this.icon,
  });

  final Type type;
  final String hour;
  final String message;
  final int duration;
  final Color color;
  final IconData icon;

  bool get isCheckpoint => type == Type.checkpoint;

  bool get hasHour => hour != null && hour.isNotEmpty;
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Working Experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineActivity extends StatelessWidget {
  const _TimelineActivity({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (BuildContext context, int index) {
        final Step step = steps[index];

        final IndicatorStyle indicator = step.isCheckpoint
            ? _indicatorStyleCheckpoint(step)
            : const IndicatorStyle(width: 0);

        final righChild = _RightChildTimeline(step: step);

        Widget leftChild;
        if (step.hasHour) {
          leftChild = _LeftChildTimeline(step: step);
        }

        return TimelineTile(
          alignment: TimelineAlign.manual,
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          lineXY: 0.25,
          indicatorStyle: indicator,
          startChild: leftChild,
          endChild: righChild,
          hasIndicator: step.isCheckpoint,
          beforeLineStyle: LineStyle(
            color: step.color,
            thickness: 8,
          ),
        );
      },
    );
  }

  IndicatorStyle _indicatorStyleCheckpoint(Step step) {
    return IndicatorStyle(
      width: 46,
      height: 100,
      indicator: Container(
        decoration: BoxDecoration(
          color: step.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Icon(
            step.icon,
            color: const Color(0xFF1D1E20),
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _LeftChildTimeline extends StatelessWidget {
  const _LeftChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: step.isCheckpoint ? 10 : 29),
          child: Text(
            step.hour,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        )
      ],
    );
  }
}

class _RightChildTimeline extends StatelessWidget {
  const _RightChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    final double minHeight =
        step.isCheckpoint ? 100 : step.duration.toDouble() * 8;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: step.isCheckpoint ? 20 : 39, top: 8, bottom: 8, right: 8),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: step.message,
                  style: TextStyle(
                      fontSize: 22, color: step.color, fontFamily: "OpenSans"),
                ),
                TextSpan(
                  text: '',
                  style: TextStyle(
                    fontSize: 22,
                    color: const Color(0xFFF2F2F2),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
