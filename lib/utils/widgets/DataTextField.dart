import 'package:flutter/material.dart';

BorderRadius textFieldRadius = BorderRadius.all(
  Radius.circular(30),
);

class DataTextFormField extends StatelessWidget {
  DataTextFormField({
    @required this.textFieldRadius,
    this.textFieldName,
    this.textFieldHint,
    this.hiddenText,
    this.textFieldIcon,
    this.keyboardType,
    this.controller,
    this.onSaved,
    this.validator,
  });

  final BorderRadius textFieldRadius;
  final bool hiddenText;
  final String textFieldName;
  final String textFieldHint;
  final TextInputType keyboardType;
  final IconData textFieldIcon;
  final Function onSaved;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hiddenText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: textFieldRadius,
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff57BA98),
          ),
          borderRadius: textFieldRadius,
        ),
        labelText: textFieldName,
        hintText: textFieldHint,
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          textFieldIcon,
        ),
        filled: true,
        fillColor: Color(0xff121212),
      ),
      keyboardType: keyboardType,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
