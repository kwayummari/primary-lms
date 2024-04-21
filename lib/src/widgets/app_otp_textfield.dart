import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:plms/src/utils/constants/app_const.dart';

class AppOtp extends StatelessWidget {
  final int numberOfFields;
  final Color borderColor;
  final Color? fillColor;
  final double fieldWidth;
  final bool showFieldAsBox;
  final Function(String)? onPress;
  final Function(String)? onSubmit;
  AppOtp(
      {Key? key,
      required this.numberOfFields,
      required this.borderColor,
      this.fillColor,
      required this.fieldWidth,
      required this.onPress,
      required this.onSubmit,
      required this.showFieldAsBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color actualFillColor = fillColor ?? AppConst.transparent;
    return OtpTextField(
      focusedBorderColor: AppConst.primary,
      numberOfFields: numberOfFields,
      borderColor: borderColor,
      fillColor: actualFillColor,
      filled: fillColor != null ? true : false,
      fieldWidth: fieldWidth,
      showFieldAsBox: showFieldAsBox,
      onCodeChanged: onPress,
      onSubmit: onSubmit,
    );
  }
}
/*
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  To use this widget you have to pass                                     ||
    - number of fields you want your otp to have                          || 
    - border color of those fields                                        ||
    - fill   color of those fields                                        ||
    - filled width of those fields                                        ||
    - boolean to fill color of those fields                               ||
    - boolean value to show box or not                                    ||
    - the onPress  Function                                               ||
    - the onSubmit Function                                               ||
                                                                          ||
    *** Here is the example ***                                           ||
                                                                          ||
AppOtp(                                                                   ||
            borderColor: AppConst.primary,                                ||
            numberOfFields: 5,                                            ||
            onPress: (String code) {},                                    ||
            onSubmit: (String verificationCode) {                         ||
                      showDialog(                                         ||
            context: context,                                             ||
            builder: (context) {                                          ||
              return AlertDialog(                                         ||
                title: Text("Verification Code"),                         ||
                content: Text('Code entered is $verificationCode'),       ||
              );                                                          ||
            });                                                           ||
            }, showFieldAsBox: true,                                      ||
          )                                                               ||
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/


