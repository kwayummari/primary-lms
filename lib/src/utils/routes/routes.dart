import 'package:flutter/material.dart';
import 'package:plms/src/screens/authentication/login.dart';
import 'package:plms/src/screens/authentication/userRegistration.dart';
import 'package:plms/src/screens/enrollment/introduction.dart';
import 'package:plms/src/screens/onboardingScreens/onboarding.dart';
import 'package:plms/src/screens/otp/otp.dart';
import 'package:plms/src/screens/splash/splash.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/widgets/app_bottom_navigation_bar.dart';


final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.onboardingScreens: (context) => OnboardingScreens(),
  RouteNames.otp: (context) => OtpScreen(),
  RouteNames.enrollmentIntroduction: (context) => EnrollmentIntroductionScreen(),
  RouteNames.bottomNavigation: (context) => bottomNavigation(),
};