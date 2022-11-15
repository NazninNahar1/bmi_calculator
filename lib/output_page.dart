import 'package:flutter/material.dart';

import 'constants.dart';

class OutputPage extends StatelessWidget {
  OutputPage(
      {required this.bmiResult,
      required this.resultText,
      required this.resultInterpretation});

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 80, left: 15),
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                Text(
                  resultText,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bmiResult,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                ),
                Text(
                    resultInterpretation,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                  child: Text(
                'Re-Calculate',
                style: knumberTextStyle,
              )),
            ),
          )
        ],
      ),
    );
  }
}
