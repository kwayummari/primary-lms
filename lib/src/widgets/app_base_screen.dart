import 'package:flutter/material.dart';
import 'package:plms/src/utils/constants/app_const.dart';

class AppBaseScreen extends StatelessWidget {
  final Widget child;
  final Widget? floatingAction;
  final bool? isLoading;
  final AppBar? appBar;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const AppBaseScreen(
      {Key? key,
      required this.child,
      this.isLoading = false,
      this.appBar,
      this.padding,
      this.floatingAction,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppConst.whiteOpacity,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: child,
            ),
            if (isLoading == true) const CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: floatingAction,
    );
  }
}
/*
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  To use this widget you have to pass                                     ||
    - the child widget you want to display                                || 
    - floatingAction button if it exists                                  ||
    - appBar if exist                                                     ||
    - the padding                                                         ||
    - the backgroundColor                                                 ||
    - isLoading boolean value                                             ||
                                                                          ||
    *** Here is the example ***                                           ||
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/