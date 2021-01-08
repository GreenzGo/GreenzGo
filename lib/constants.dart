import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

//TODO: #4 Update constants with Text styles, icon size and colors, container colors etc.

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

List<String> kparishDropDownItems = [
  'Saint George',
  'Saint David',
  'Saint Andrew',
  'Saint Patrick',
  'Saint John',
  'Saint Mark',
  'Carriacou',
];

List<DropdownMenuItem<String>> vehicleDropDownItems = [
  DropdownMenuItem(
    child: Text('Car'),
    value: 'car',
  ),
  DropdownMenuItem(
    child: Text('Van'),
    value: 'van',
  ),
  DropdownMenuItem(
    child: Text('Truck'),
    value: 'truck',
  ),
  DropdownMenuItem(
    child: Text('Other'),
    value: 'other',
  ),
  DropdownMenuItem(
    child: Text('Any'),
    value: 'Any',
  ),
];

List<DropdownMenuItem<String>> driveTypeDropDownItems = [
  DropdownMenuItem(
    child: Text('Manual'),
    value: 'Manual',
  ),
  DropdownMenuItem(
    child: Text('Automatic'),
    value: 'Automatic',
  ),
];

List<DropdownMenuItem<String>> parishDropDownItems = [
  DropdownMenuItem(
    child: Text('Saint George'),
    value: 'Saint George',
  ),
  DropdownMenuItem(
    child: Text('Saint Andrew'),
    value: 'Saint Andrew',
  ),
  DropdownMenuItem(
    child: Text('Saint David'),
    value: 'Saint David',
  ),
  DropdownMenuItem(
    child: Text('Saint Patrick'),
    value: 'Saint Patrick',
  ),
  DropdownMenuItem(
    child: Text('Saint John'),
    value: 'Saint John',
  ),
  DropdownMenuItem(
    child: Text('Saint  Mark'),
    value: 'Saint  Mark',
  ),
  DropdownMenuItem(
    child: Text('Carriacou'),
    value: 'Carriacou',
  ),
  DropdownMenuItem(
    child: Text('Any'),
    value: 'any',
  ),
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
