// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:plms/src/sharedPreferences/sharedData.dart';
import 'package:plms/src/utils/animation/fade_animation.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/gateway/api.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_base_screen.dart';
import 'package:plms/src/widgets/app_button.dart';
import 'package:plms/src/widgets/app_input_text.dart';
import 'package:plms/src/widgets/app_snackbar.dart';
import 'package:plms/src/widgets/app_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  Api api = Api();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  SharedData sharedData = SharedData();
  bool obscure = true;
  bool marked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      padding: EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Registration.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 30),
                  child: FadeAnimation(
                    1.2,
                    Material(
                      color: AppConst.white,
                      elevation: 5,
                      shape: const CircleBorder(),
                      shadowColor: AppConst.black,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppConst.white,
                            ),
                            height: 120,
                            width: 120,
                            child: Image.asset('assets/logo.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  color: AppConst.whiteOpacity,
                  elevation: 5,
                  shadowColor: AppConst.black,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                txt: 'Sign up',
                                size: 18,
                                color: AppConst.black,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  image: DecorationImage(
                                    image: AssetImage('assets/english.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: AppInputText(
                              textfieldcontroller: username,
                              label: 'Username',
                              isemail: false,
                              fillcolor: AppConst.white,
                              suffixicon: IconButton(
                                  onPressed: () => null,
                                  icon: Icon(
                                    Icons.person,
                                    color: AppConst.primary,
                                  )),
                              obscure: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: AppInputText(
                              textfieldcontroller: phoneNumber,
                              label: 'Phone',
                              isemail: false,
                              fillcolor: AppConst.white,
                              suffixicon: IconButton(
                                  onPressed: () => null,
                                  icon: Icon(
                                    Icons.phone,
                                    color: AppConst.primary,
                                  )),
                              obscure: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: AppInputText(
                              textfieldcontroller: password,
                              label: 'Password',
                              isemail: false,
                              fillcolor: AppConst.white,
                              suffixicon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscure = !obscure;
                                    });
                                  },
                                  icon: Icon(
                                    obscure ? Icons.lock : Icons.lock_open,
                                    color: AppConst.primary,
                                  )),
                              obscure: obscure),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              family: 'OpenSans',
                              txt: 'Forgot your password?',
                              size: 15,
                              color: AppConst.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 60,
                      top: 10,
                      child: AppButton(
                          onPress: () =>
                              Navigator.pushNamed(context, RouteNames.login),
                          label: 'Sign in',
                          borderRadius: 10,
                          textColor: AppConst.black,
                          bcolor: AppConst.greyish),
                    ),
                    Positioned(
                      right: 70,
                      top: -20,
                      child: GestureDetector(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          var formedData = {
                            'user_name': username.text.toString(),
                            'phone': phoneNumber.text.toString(),
                            'password': password.text.toString()
                          };
                          var registrationRequest = await api.post(
                              context, 'auth/register', formedData);
                          if (registrationRequest != null &&
                              registrationRequest.isNotEmpty &&
                              registrationRequest['status'] == 0) {
                            sharedData.setData(
                                registrationRequest['data']['user_name'],
                                registrationRequest['data']['phone'],
                                registrationRequest['data']['role_id'],
                                registrationRequest['data']['id']);
                            AppSnackbar(
                              isError: false,
                              response:
                                  registrationRequest['message'].toString(),
                            ).show(context);
                            Navigator.pushReplacementNamed(
                                context, RouteNames.otp);
                          }
                        },
                        child: FadeAnimation(
                          1.2,
                          Material(
                            color: AppConst.primary,
                            elevation: 5,
                            shape: const CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppText(
                                txt: 'GO',
                                size: 20,
                                color: AppConst.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
