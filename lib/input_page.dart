import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/output_page.dart';
import 'package:bmi_calculator/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'custom_icon_text.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? genderSelected;

  double heightValue = 180;
  double weightValue = 20;
  int ageValue = 1;

//   Color maleCardColor = inactiveColor;
//   Color femaleCardColor = inactiveColor;
//
//   void updateColor(GenderType gender){
//     if(gender==GenderType.male){
//      if(maleCardColor==inactiveColor){
//        maleCardColor=activeColor;
//        femaleCardColor=inactiveColor;
//      }else{
//        maleCardColor=inactiveColor;
//      }
//     }
//     if(gender==GenderType.female){
//   if(femaleCardColor==inactiveColor){
//   femaleCardColor=activeColor;
//   maleCardColor=inactiveColor;
//   }else{
//   femaleCardColor=inactiveColor;
//   }
//   }
//
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: const Icon(Icons.menu_rounded),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = GenderType.male;
                      });
                    },
                    child: ReusableWidget(
                      cardChild: CardIcon(
                        cicon: FontAwesomeIcons.person,
                        text: 'Male',
                      ),
                      colour: genderSelected == GenderType.male
                          ? kactiveColor
                          : kinactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = GenderType.female;
                      });
                    },
                    child: ReusableWidget(
                      cardChild: CardIcon(
                        cicon: FontAwesomeIcons.personDress,
                        text: 'Female',
                      ),
                      colour: genderSelected == GenderType.female
                          ? kactiveColor
                          : kinactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: kinactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: ktextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightValue.round().toString(),
                        style: knumberTextStyle,
                      ),
                      const Text(
                        "CM",
                      ),
                    ],
                  ),
                  Slider(
                      value: heightValue.toDouble(),
                      label: heightValue.round().toString(),
                      min: 120,
                      max: 250,
                      activeColor: Colors.pinkAccent,
                      inactiveColor: Colors.white,
                      onChanged: (double value) {
                        setState(() {
                          heightValue = value.toDouble();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: ktextStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                ontap: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                ontap: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                    colour: kinactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: ktextStyle,
                        ),
                        Text(
                          ageValue.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                ontap: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                ontap: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                    colour: kinactiveColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain clc =
                  BmiBrain(height: (heightValue), weight: weightValue);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => OutputPage(
                      bmiResult: clc.bmiCalculate(),
                      resultText: clc.getResult(),
                      resultInterpretation: clc.getInterPretation()),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                color: Colors.pinkAccent,
              ),
              child: const Center(
                  child: Text(
                'Calculate',
                style: knumberTextStyle,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, this.ontap});

  final IconData icon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: ontap,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.pinkAccent,
    );
  }
}
