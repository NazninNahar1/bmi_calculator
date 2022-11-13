import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.colour, this.cardChild, this.onpressed});

  final Color colour;
  final Widget? cardChild;
  final Function? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}