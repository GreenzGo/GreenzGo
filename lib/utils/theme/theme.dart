import 'package:flutter/material.dart';

ThemeData darkTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      button: base.button.copyWith(
        fontFamily: 'Comfortaa',
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: base.bodyText1.copyWith(
        fontFamily: 'Comfortaa',
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: base.bodyText2.copyWith(
        fontFamily: 'Comfortaa',
        fontSize: 14.0,
        color: Color(0xff57BA98),
        fontWeight: FontWeight.bold,
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: 'Comfortaa',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      headline1: base.headline1.copyWith(
        fontFamily: 'Playfair Display',
        fontSize: 32.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      headline6: base.headline6.copyWith(
        fontFamily: 'Comfortaa',
        fontSize: 32.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff57BA98),
          onSurface: Colors.white,
          minimumSize: Size(160, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      textTheme: _basicTextTheme(base.textTheme),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      primaryColor: Color(0xff121212),
      scaffoldBackgroundColor: Color(0xff2A2A2A),
      accentColor: Color(0xff57BA98),
      backgroundColor: Color(0xff121212),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xff57BA98),
        unselectedLabelColor: Colors.white,
      ));
}
