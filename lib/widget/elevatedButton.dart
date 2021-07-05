import 'package:flutter/material.dart';

Widget elevatedbutton(
  BuildContext context, {
  Function onPressed,
  String textString,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(textString),
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
    ),
  );
}
