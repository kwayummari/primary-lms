// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? txt;
  var color;
  var weight;
  double size;
  var family;
  var align;
  TextDecoration? textdecoration;
  AppText(
      {Key? key,
      required this.txt,
      this.color,
      this.weight,
      this.textdecoration,
      this.family,
      this.align,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt.toString(),
      textAlign: align ?? null,
      style: TextStyle(
        decoration: textdecoration,
        color: color,
        fontSize: size,
        fontFamily: family ?? 'ClashGrotesk',
        fontWeight: weight,
      ),
    );
  }
}
