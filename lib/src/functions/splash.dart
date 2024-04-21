// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var onboardingScreens;
  var user_id;
  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

    if (onboardingScreens == null) {
      Navigator.pushNamed(context, RouteNames.onboardingScreens);
    } else if (user_id != null) {
      Navigator.pushNamed(context, RouteNames.bottomNavigation);
    } else {
      Navigator.pushNamed(context, RouteNames.login);
    }
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var introductionScreen = sharedPreferences.getString('introductionScreen');
    var id = sharedPreferences.getString('user_id');
    onboardingScreens = introductionScreen;
    user_id = id;
  }

  Future<void> setOnboarding() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('introductionScreen', 'done');
  }

  Future<String> getIntro() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var introductionScreen = sharedPreferences.getString('introductionScreen');
    return introductionScreen.toString();
  }
}
