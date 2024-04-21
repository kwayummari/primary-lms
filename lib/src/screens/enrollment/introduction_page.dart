import 'package:flutter/material.dart';
import 'package:plms/src/screens/enrollment/forms/academias.dart';
import 'package:plms/src/screens/enrollment/forms/parent.dart';
import 'package:plms/src/utils/animation/fade_animation.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:plms/src/functions/splash.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';
import 'package:plms/src/widgets/app_button.dart';

Widget introductionPage(
    Map<String, String> screen,
    int index,
    BuildContext context,
    Function(int) setPage,
    Function(bool) setIsAcademia,
    bool isAcademia) {
  return SingleChildScrollView(
    child: Container(
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
            1.2,
            Image.asset(
              screen['asset']!,
              height: index.toString() == '2'
                  ? MediaQuery.of(context).size.height / 3.4
                  : MediaQuery.of(context).size.height / 2.4,
            ),
          ),
          FadeAnimation(
            1.2,
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
          ),
          FadeAnimation(
            1.2,
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
              child: Material(
                elevation: 5,
                child: Container(
                  height: (index.toString() == '2')
                      ? MediaQuery.of(context).size.height / 1.94
                      : MediaQuery.of(context).size.height / 2.4,
                  decoration: BoxDecoration(
                    color: AppConst.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppConst.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 40, right: 40),
                              child: AppText(
                                align: TextAlign.center,
                                weight: FontWeight.w300,
                                txt: screen['title'],
                                size: 28,
                              ),
                            ),
                            if (index.toString() != '2')
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: AppText(
                                  txt: screen['subtitle'],
                                  size: 20,
                                  family: 'OpenSans',
                                  align: TextAlign.center,
                                  color: AppConst.greyish,
                                ),
                              ),
                            if (index.toString() == '0')
                              FadeAnimation(
                                1.2,
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    height: 50,
                                    child: Material(
                                      elevation: 5,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                      child: AppButton(
                                        onPress: () {
                                          SplashFunction().setOnboarding();
                                          Navigator.pushNamed(
                                              context, RouteNames.login);
                                        },
                                        label: 'Next',
                                        labelSize: 22,
                                        borderRadius: 11,
                                        textColor: AppConst.black,
                                        bcolor: AppConst.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (index.toString() == '1')
                              FadeAnimation(
                                1.2,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 80, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.6,
                                        height: 50,
                                        child: Material(
                                          elevation: 5,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11)),
                                          child: AppButton(
                                            onPress: () {
                                              setIsAcademia(false);
                                              debugPrint(isAcademia
                                                  ? 'true'
                                                  : 'false');
                                              setPage(index + 1);
                                            },
                                            label: 'Parent',
                                            labelSize: 22,
                                            borderRadius: 11,
                                            textColor: AppConst.black,
                                            bcolor: AppConst.primary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.6,
                                        height: 50,
                                        child: Material(
                                          elevation: 5,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11)),
                                          child: AppButton(
                                            onPress: () {
                                              setIsAcademia(true);
                                              setPage(index + 1);
                                            },
                                            label: 'Academias',
                                            labelSize: 22,
                                            borderRadius: 11,
                                            textColor: AppConst.black,
                                            bcolor: AppConst.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (index.toString() == '2')
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  child: isAcademia ? Academia() : Parent())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
