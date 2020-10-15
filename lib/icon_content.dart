// import 'package:bmi_calculator/const.dart';
import 'package:flutter/material.dart';
import 'const.dart';

class Iconcontent extends StatelessWidget {
  Iconcontent(this.icon, this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: klabelstyle,
        ),
      ],
    );
  }
}
