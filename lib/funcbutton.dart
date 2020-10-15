
import 'package:flutter/material.dart';
import 'const.dart';
class FuncButton extends StatelessWidget {
  FuncButton({@required this.label, @required this.ontap});
  final Function ontap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
            child: Text(
          label,
          style: klargebutton,
        )),
        margin: EdgeInsets.only(top: 10.0),
        color: kbottomcolor,
        height: kbuttonhight,
        width: double.infinity,
      ),
    );
  }
  
}