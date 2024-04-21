import 'package:flutter/material.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';

class AppInputText extends StatelessWidget {
  final TextEditingController? textfieldcontroller;
  final String? header;
  final String? hint;
  final String? label;
  final String? family;
  final Icon? prefixIcon;
  final Color? fillcolor;
  final Color? borderColor;
  final IconButton? suffixicon;
  final bool obscure;
  final Function? validate;
  final Function(String)? onChange;
  final bool isemail;
  final double? circle;
  final bool? enabled;
  AppInputText({
    Key? key,
    this.hint,
    this.borderColor,
    this.family,
    required this.textfieldcontroller,
    required this.isemail,
    required this.fillcolor,
    this.prefixIcon,
    this.suffixicon,
    this.onChange,
    this.header,
    this.label,
    required this.obscure,
    this.validate,
    this.circle,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null)
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              txt: header,
              size: 15,
              color: AppConst.secondary,
              weight: FontWeight.w900,
            ),
          ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          style: TextStyle(color: AppConst.primary),
          enabled: enabled ?? true,
          onChanged: onChange,
          obscureText: obscure,
          obscuringCharacter: '*',
          controller: textfieldcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circle ?? 5.0),
            ),
            hintText: hint ?? null,
            hintStyle: TextStyle(color: AppConst.hint),
            filled: true,
            label: label != null
                ? AppText(
                    txt: label,
                    size: 15,
                    family: family ?? 'ClashGrotesk',
                    color: AppConst.hint,
                  )
                : null,
            fillColor: fillcolor,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circle ?? 5.0),
              borderSide: BorderSide(color: borderColor ?? AppConst.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circle ?? 5.0),
              borderSide: BorderSide(color: borderColor ?? AppConst.primary),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixicon,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');
            if (isemail) {
              if (value!.isNotEmpty) {
                return null;
              } else if (value.isEmpty) {
                return "THis field cannot be empty";
              } else if (!regex.hasMatch(value)) {
                return 'Password should contain \n -at least one upper case \n -at least one lower case \n -at least one digit \n -at least one Special character \n -Must be at least 8 characters in length';
              }
            } else {
              if (value!.isNotEmpty) {
                return null;
              } else if (value.isEmpty) {
                return "THis field cannot be empty";
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
