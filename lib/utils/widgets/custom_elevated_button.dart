import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    @required this.onPressed,
    this.buttonLabel,
  });

  final Function onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(
        buttonLabel.toUpperCase(),
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
