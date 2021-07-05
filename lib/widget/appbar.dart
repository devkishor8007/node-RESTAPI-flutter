import 'package:flutter/material.dart';

Widget appbar(
  BuildContext context, {
  Function onPressed,
  String textString,
  List<Widget> actions,
}) {
  return AppBar(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      title: Text(textString),
      centerTitle: true,
      actions: actions);
}
