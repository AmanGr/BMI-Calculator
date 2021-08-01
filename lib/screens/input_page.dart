import 'package:bmi_calculator/screens/results_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_pages.dart';
import '../components/botton_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
// Dart Ternary Operator have been used
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Color maleCardColour = inactiveCardColor;
  // Color femaleCardColour = inactiveCardColor;

  // void updateColour(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColor) {
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColor;
  //     } else {
  //       maleCardColour = inactiveCardColor;
  //       femaleCardColour = activeCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColor) {
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColor;
  //     } else {
  //       femaleCardColour = inactiveCardColor;
  //       maleCardColour = activeCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0X508D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0XFF74777D),
                        overlayColor: Color(0X30FFFFFF),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 120.0,
                        max: 220.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          interpretation: calc.getInterpretation(),
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),

                        ),
                    ),
                );
              },
            ),
          ],
        ));
  }
}

