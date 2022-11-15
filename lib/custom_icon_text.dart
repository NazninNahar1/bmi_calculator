import 'package:flutter/material.dart';
import 'constants.dart';
class CardIcon extends StatelessWidget {
  CardIcon({required this.cicon, required this.text});
  final IconData cicon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          cicon,
          size: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: ktextStyle,
        ),
      ],
    );
  }
}