import 'package:flutter/material.dart';
import 'package:plms/src/utils/animation/fade_animation.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/widgets/app_base_screen.dart';
import 'package:plms/src/widgets/app_otp_textfield.dart';
import 'package:plms/src/widgets/app_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      backgroundColor: AppConst.subprimary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppConst.white,
                        width: 2.0,
                      ),
                    ),
                    child: Material(
                      color: AppConst.primary,
                      elevation: 5,
                      shape: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppConst.white,
                        ),
                      ),
                    ),
                  ),
                ),
                AppText(
                  txt: 'Enter verification code',
                  size: 18,
                  color: AppConst.white,
                ),
                SizedBox()
              ],
            ),
          ),
          FadeAnimation(
            1.2,
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Image.asset('assets/Email.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: AppText(
              txt: 'We have sent otp to your number',
              size: 18,
              color: AppConst.white,
            ),
          ),
          FadeAnimation(
            1.2,
            AppOtp(
              borderColor: AppConst.primary,
              fillColor: AppConst.white,
              showFieldAsBox: true,
              numberOfFields: 4,
              fieldWidth: 60,
              onPress: (String code) {},
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: AppText(
              txt: 'Didn\'t receive an OTP? Resend OTP',
              size: 18,
              color: AppConst.white,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 60, right: 60, bottom: 40, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: '7',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '8',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '9',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: '4',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '5',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '6',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: '1',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '2',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                AppText(
                  txt: '3',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(
                        context, RouteNames.enrollmentIntroduction),
                    icon: Icon(
                      Icons.done,
                      size: 30,
                      color: AppConst.white,
                    )),
                AppText(
                  txt: '0',
                  size: 30,
                  color: AppConst.white,
                  family: 'OpenSans',
                ),
                Icon(
                  Icons.backspace,
                  color: AppConst.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
