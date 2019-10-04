import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/CardLayout.dart';
import 'package:bmi_calculator/components/controller_row.dart';

class Result extends StatelessWidget {
  final String bmi;
  final String status;

  const Result({this.bmi, this.status});

  @override
  Widget build(BuildContext context) {

    String bmiWhole = bmi.substring(0 ,bmi.indexOf("."));
    String bmiPrecision = bmi.substring(bmi.indexOf("."), bmi.length);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: CardLayout(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(bmiWhole,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff565568),
                      ),
                    ),
                    Text(bmiPrecision,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff565568),
                      ),
                    )
                  ],
                ),
                Text(status,
                  style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),

                ListTile(
                  title: RaisedButton(onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.all(18),
                    color: Theme.of(context).accentColor,
                    child: Text('RE-CALCULATE',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 20
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}