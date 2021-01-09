import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

//TODO: #0.5 Update constants with Text styles, icon size and colors, container colors etc.

const kButtonTextColor = Color(0xff57ba98);
const kTextColor = Color(0xff57ba98);

List<S2Choice<String>> kvehicleType = [
  S2Choice(value: 'car', title: 'Car'),
  S2Choice(value: 'van', title: 'Van'),
  S2Choice(value: 'truck', title: 'Truck'),
  S2Choice(value: 'other', title: 'Other'),
  S2Choice(value: 'any', title: 'Any'),
];

List<S2Choice<String>> kparishLocale = [
  S2Choice(value: 'Saint George', title: 'Saint George'),
  S2Choice(value: 'Saint Andrew', title: 'Saint Andrew'),
  S2Choice(value: 'Saint David', title: 'Saint David'),
  S2Choice(value: 'Saint John', title: 'Saint John'),
  S2Choice(value: 'Saint Mark', title: 'Saint Mark'),
  S2Choice(value: 'Saint Patrick', title: 'Saint Patrick'),
];

List<String> kVehicleTypeDropDownItems = [
  'Car',
  'Van',
  'Truck',
  'Other',
  'Any',
];

List<String> kdriveTypeDropDownItems = [
  'Manual',
  'Automatic',
];

List<String> kvehicleStatusDropDownItems = [
  'Available',
  'Pending',
  'Unavailable',
];

List<String> kparishDropDownItems = [
  'Saint George',
  'Saint David',
  'Saint Andrew',
  'Saint Patrick',
  'Saint John',
  'Saint Mark',
  'Carriacou',
];

class RegFormVal {
  String username;
  String email;
  String password;
  String accountType;
  int age;
}
