import 'package:flutter/material.dart';
import 'package:plms/src/utils/animation/fade_animation.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/widgets/app_input_text.dart';
import 'package:plms/src/widgets/app_text.dart';

class Academia extends StatefulWidget {
  const Academia({super.key});

  @override
  State<Academia> createState() => _AcademiaState();
}

class _AcademiaState extends State<Academia> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;
  bool marked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AppInputText(
                textfieldcontroller: username,
                label: 'Enrollment id',
                isemail: false,
                fillcolor: AppConst.white,
                obscure: false),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 110, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/kidevu.png',
                  width: 40,
                ),
                Row(
                  children: [
                    Radio(
                        value: true, groupValue: 1, onChanged: (value) => null),
                    AppText(
                      txt: 'Male',
                      family: 'OpenSans',
                      size: 20,
                      color: AppConst.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: false,
                        groupValue: 2,
                        onChanged: (value) => null),
                    AppText(
                      txt: 'Female',
                      family: 'OpenSans',
                      size: 20,
                      color: AppConst.black,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: AppConst.greyish,
                ),
                SizedBox(
                  width: 20,
                ),
                AppText(
                  txt: 'Select date of birth',
                  family: 'OpenSans',
                  size: 20,
                  color: AppConst.greyish,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AppInputText(
                textfieldcontroller: username,
                label: 'Gender',
                isemail: false,
                fillcolor: AppConst.white,
                obscure: false),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AppInputText(
                textfieldcontroller: username,
                label: 'Class',
                isemail: false,
                fillcolor: AppConst.white,
                obscure: false),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 40,
                  top: 30,
                  child: FadeAnimation(
                    1.2,
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, RouteNames.bottomNavigation),
                      child: Material(
                        color: AppConst.primary,
                        elevation: 5,
                        shape: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            txt: 'GO',
                            size: 25,
                            color: AppConst.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
