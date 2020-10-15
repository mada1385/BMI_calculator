import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'mycontainer.dart';
import 'const.dart';
import 'result.dart';
import 'funcbutton.dart';
import 'functions.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

gender selectedgender;

class _InputPageState extends State<InputPage> {
  int hight = 180;
  int wight = 80;
  int age = 25;
  int select;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Mycontainer(
                    mycolor: selectedgender == gender.male
                        ? kactivecolor
                        : kinactivecardcolor,
                    cardchild: new Iconcontent(FontAwesomeIcons.mars, "male"),
                    ontap: () {
                      setState(() {
                        selectedgender = gender.male;
                        select = 1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Mycontainer(
                    mycolor: selectedgender == gender.female
                        ? kactivecolor
                        : kinactivecardcolor,
                    cardchild:
                        new Iconcontent(FontAwesomeIcons.venus, "female"),
                    ontap: () {
                      setState(() {
                        selectedgender = gender.female;
                        select = 2;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Mycontainer(
                    mycolor: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HIGHT",
                          style: klabelstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(hight.toString(), style: kbigfont),
                            Text(
                              "CM",
                              style: klabelstyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: kbottomcolor,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              overlayColor: Color(0x29Eb1555),
                              activeTrackColor: Colors.white),
                          child: Slider(
                            value: hight.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double changevalue) {
                              setState(() {
                                hight = changevalue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Mycontainer(
                  mycolor: kactivecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            wight.toString(),
                            style: kbigfont,
                          ),
                          Text(
                            "KG",
                            style: klabelstyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                wight -= 1;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                wight += 1;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus),
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: Mycontainer(
                    mycolor: kactivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kbigfont,
                            ),
                            Text(
                              "year",
                              style: klabelstyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new FuncButton(
            label: "Calculate",
            ontap: () {
              Bmi_calc calc = Bmi_calc(
                hight: hight,
                weight: wight,
                gender: select,
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Result(
                  bmi: calc.bmicalc(),
                  advice: calc.whatadvice(),
                  resultcolor: calc.whatcolor(),
                  status: calc.whatbody(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}
