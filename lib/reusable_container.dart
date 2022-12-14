import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardChild,
    );
  }
}