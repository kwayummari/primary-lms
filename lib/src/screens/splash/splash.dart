// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plms/src/functions/splash.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_base_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SplashFunction().navigatorToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        Image.asset('assets/logo.png', height: 120,),
        SizedBox(
          height: 20,
        ),
        Center(
          child: SpinKitThreeBounce(
            size: 40,
            color: AppConst.primary,
          ),
        ),
      ],
    ));
  }
}
