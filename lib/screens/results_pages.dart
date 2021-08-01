import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/botton_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.interpretation, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "your result",
                  style: KTitleTextStyle,
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,
                    ),
                  ],
                ),
                onPress: onPress),
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          },
              buttonTitle:
          "RE-CALCULATE"
          ),
        ],
      ),
    );
  }

  void onPress() {
  }
}
