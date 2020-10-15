import 'package:flutter/material.dart';
import 'const.dart';



class Mycontainer extends StatelessWidget {
  Mycontainer({this.mycolor, this.cardchild , this.ontap});
  final Color mycolor;
  final Widget cardchild;
  final Function ontap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap ,
          child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: mycolor,
        ),
      ),
    );
  }
}