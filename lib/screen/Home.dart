import 'package:bmi_calculator/components/CardLayout.dart';
import 'package:bmi_calculator/components/controller_row.dart';
import 'package:bmi_calculator/screen/Result.dart';
import 'package:bmi_calculator/util/calculations.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender _selectedGender = Gender.Male;

  int age = 21;
  int weight = 60;
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text('BMI CALCULATOR', style: kAppBarTextStyle),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Choose Gender',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Icon(
                                  FontAwesomeIcons.male,
                                  color: _selectedGender == Gender.Male
                                      ? Colors.blue
                                      : Colors.grey[400],
                                  size: 60,
                                ),
                              ),
                              onTap: () {
                                _updateGender(Gender.Male);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Icon(
                                  FontAwesomeIcons.female,
                                  color: _selectedGender == Gender.Female
                                      ? Colors.pink
                                      : Colors.grey[400],
                                  size: 60,
                                ),
                              ),
                              onTap: () {
                                _updateGender(Gender.Female);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CardLayout(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$age',
                            style: kLargeTextStyle,
                          ),
                          ValueController(onPlusPressed: () {
                            setState(() {
                              age++;
                            });
                          }, onMinusPressed: () {
                            setState(() {
                              if (age == 0)
                                age = 0;
                              else
                                age--;
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardLayout(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$weight',
                            style: kLargeTextStyle,
                          ),
                          ValueController(
                            onPlusPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            onMinusPressed: () {
                              setState(() {
                                if (weight == 0) {
                                  weight = 0;
                                } else {
                                  weight--;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardLayout(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$height cm',
                      style: kLargeTextStyle,
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: FloatingActionButton.extended(
                onPressed: () {
                  BMI calculator = BMI(height: height, weight: weight);

                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Result(
                      bmi: calculator.calculateBMI(),
                      status: calculator.getResult(),
                    );
                  }));
                },
                icon: Icon(FontAwesomeIcons.calculator),
                label: Text("CALCULATE"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateGender(Gender gender) {
    print(gender.toString());
    setState(() {
      _selectedGender = gender;
    });
  }
}
