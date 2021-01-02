import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    this.cardChild,
    this.onPress,
    this.cardHeight,
    this.cardWidth,
    this.borderRadius,
  });

  final Function onPress;

  final Color colour;
  final Widget cardChild;
  final double cardHeight;
  final double cardWidth;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: colour,
        ),
      ),
    );
  }
}
