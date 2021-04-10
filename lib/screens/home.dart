import 'package:flutter/material.dart';
import 'package:portfolio/screens/const.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
              "  Uchenna",
              style: kUcheTextStyle,
            ),
            Expanded(
              child: Text(
                " Alozie",
                style: kAlozieTextStyle,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xFF686868),
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
      ),
    );
  }
}
