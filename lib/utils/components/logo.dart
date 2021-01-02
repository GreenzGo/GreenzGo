import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'images/Logo.png',
        fit: BoxFit.scaleDown,
        scale: 7,
      ),
      height: 150.00,
      width: 150.00,
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Color(0xff57ba98),
        border: Border.all(
          width: 8.00,
          color: Color(0xfff2f2f2),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
