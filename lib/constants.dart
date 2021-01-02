import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_select/smart_select.dart';

//TODO: #4 Update constants with Text styles, icon size and colors, container colors etc.

const kButtonTextColor = Color(0xff57ba98);
const kTextColor = Color(0xff57ba98);

const kfilterOptionsTextStyle = TextStyle(
  fontFamily: "Segoe UI",
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: kButtonTextColor,
);

const kButtonTextStyle = TextStyle(
  fontFamily: "Segoe UI",
  fontWeight: FontWeight.w700,
  fontSize: 36,
  color: kButtonTextColor,
);
const List<Icon> vehicleIcon = [
  Icon(FontAwesomeIcons.car),
  Icon(FontAwesomeIcons.caravan),
  Icon(FontAwesomeIcons.truck),
];

List<S2Choice<String>> kvehicleType = [
  S2Choice(value: 'car', title: 'Car'),
  S2Choice(value: 'van', title: 'Van'),
  S2Choice(value: 'truck', title: 'Truck'),
  S2Choice(value: 'any', title: 'Any'),
];

List<S2Choice<String>> kparishLocale = [
  S2Choice(value: 'st_george', title: 'St. George'),
  S2Choice(value: 'st_andrew', title: 'St. Andrews'),
  S2Choice(value: 'st_david', title: 'St. David'),
  S2Choice(value: 'st_john', title: 'St. John'),
  S2Choice(value: 'st_mark', title: 'St. Marks'),
  S2Choice(value: 'st_patrick', title: 'St. Patrick'),
];

const kVehicleDropDownList = <String>['', 'Car', 'Van', 'Truck', 'Any'];

const kLocationDropDownList = <String>[
  '',
  'St.George',
  'St.Andrews',
  'St.Patrick',
  'St.David',
  'St.John',
  'St.Marks'
];

class RegFormVal {
  String username;
  String email;
  String password;
  String accountType;
  int age;
}
