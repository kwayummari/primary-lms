import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final List<TextSpan> children;

  CustomRichText({
    required this.text,
    required this.textStyle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: textStyle,
        children: children,
      ),
    );
  }
}
