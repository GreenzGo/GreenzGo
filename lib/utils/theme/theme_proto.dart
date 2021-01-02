import 'package:flutter/material.dart';

class ThemeProto {
  bool isDark;

  ThemeProto({@required isDark});

  ThemeData get themeData {
    TextTheme textTheme =
        (isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme);
    Color textColor = textTheme.bodyText1.color;

    ColorScheme colorScheme = ColorScheme(
        primary: Color(0xff121212),
        primaryVariant: Color(0xff000000),
        secondary: Color(0xff57ba98),
        secondaryVariant: Color(0xff1c8969),
        surface: Color(0xff2a2a2a),
        background: Color(0xff121212),
        error: Colors.red.shade500,
        onPrimary: Color(0xff57ba98),
        onSecondary: Color(0xff0c0c0c),
        onSurface: Color(0xff57ba98),
        onBackground: Color(0xff57ba98),
        onError: Colors.white,
        brightness: isDark ? Brightness.dark : Brightness.light);

    var t =
        ThemeData.from(colorScheme: colorScheme, textTheme: textTheme).copyWith(
      buttonColor: Color(0xff57BA98),
      cursorColor: Color(0xff57BA98),
      highlightColor: Color(0xff57BA98),
      toggleableActiveColor: Color(0xff57BA98),
      tabBarTheme: TabBarTheme(
        labelColor: Color(0xff57BA98),
        unselectedLabelColor: Colors.white,
      ),
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
    );

    return t;
  }
}
