import 'package:flutter/material.dart';
import 'package:plms/src/utils/animation/fade_animation.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/functions/splash.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';
import 'package:plms/src/widgets/app_button.dart';

Widget buildPage(Map<String, String> screen, int index, BuildContext context,
    Function(int) setPage) {
  return SingleChildScrollView(
    child: Container(
      color: AppConst.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (index != 0)
                  GestureDetector(
                    onTap: () {
                      if (index > 0) {
                        setPage(index - 1);
                      }
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
                if (index == 0) SizedBox(),
                if (index < 2)
                  GestureDetector(
                    onTap: () {
                      SplashFunction().setOnboarding();
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                    child: AppText(
                      txt: 'Skip',
                      size: 18,
                      color: AppConst.white,
                    ),
                  )
              ],
            ),
          ),
          FadeAnimation(
            1.2, Image.asset(
              screen['asset']!,
              height: index.toString() == '0'
                  ? MediaQuery.of(context).size.height / 2.4
                  : MediaQuery.of(context).size.height / 2.4,
            ),
          ),
          FadeAnimation(
            1.2, Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppConst.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        txt: '.',
                        size: 40,
                        color: index == 0 ? AppConst.primary : AppConst.greyish,
                      ),
                      AppText(
                        txt: '.',
                        size: 40,
                        color: index == 1 ? AppConst.primary : AppConst.greyish,
                      ),
                      AppText(
                        txt: '.',
                        size: 40,
                        color: index == 2 ? AppConst.primary : AppConst.greyish,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: AppText(
                      family: 'OpenSans',
                      align: TextAlign.center,
                      weight: FontWeight.w900,
                      txt: screen['title'],
                      size: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppText(
                      txt: screen['subtitle'],
                      size: 20,
                      family: 'OpenSans',
                      align: TextAlign.center,
                      color: AppConst.greyish,
                    ),
                  ),
                  FadeAnimation(
                    1.2, Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          child: AppButton(
                            onPress: () {
                              SplashFunction().setOnboarding();
                              Navigator.pushNamed(context, RouteNames.login);
                            },
                            label: 'Get Started',
                            borderRadius: 11,
                            textColor: AppConst.white,
                            bcolor: AppConst.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
