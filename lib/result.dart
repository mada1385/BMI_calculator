import 'package:bmi/const.dart';
import 'package:bmi/funcbutton.dart';
import 'package:bmi/mycontainer.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'icon_content.dart';

class Result extends StatelessWidget {
  Result({this.advice, this.bmi, this.resultcolor, this.status});
  final Color resultcolor;
  final String status;
  final String bmi;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "BMI CALCULATOR",
          style: klabelstyle,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Your Result",
                      style: kbigfont,
                    )),
              )
            ],
          ),
          Expanded(
            child: Mycontainer(
              mycolor: kactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    status,
                    style: TextStyle(
                      color: resultcolor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: kbmi,
                  ),
                  Text(
                    advice,
                    style: kbody,
                  ),
                ],
              ),
            ),
          ),
          FuncButton(
            label: "Recalculate",
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InputPage();
              }));
            },
          )
        ],
      ),
    );
  }
}
