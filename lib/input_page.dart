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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    onpressed: (){
                        setState(() {
                          genderSelected= GenderType.male;
                        });
                    },
                    cardChild: CardIcon(
                      cicon: FontAwesomeIcons.person,
                      text: 'Male',
                    ),
                    colour:genderSelected==GenderType.male? activeColor:inactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onpressed: (){
                      setState(() {
                        genderSelected= GenderType.female;
                      });
                    },
                    cardChild: CardIcon(
                      cicon: FontAwesomeIcons.personDress,
                      text: 'Female',
                    ),
                    colour: genderSelected==GenderType.female? activeColor:inactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: inactiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    colour: inactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: inactiveColor,
                  ),
                ),
              ],
            ),
          ),
         Container(
           width: double.infinity,
           height: 80,
           color: Colors.pinkAccent,
         )
        ],
      ),
    );
  }
}




