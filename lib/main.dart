import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/functions/createMaterialColor.dart';
import 'package:plms/src/utils/routes/routes.dart';
import 'package:plms/src/utils/routes/route-names.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        initialRoute: RouteNames.splash,
        routes: routes,
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'PLMS',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
              color: AppConst.secondary,
            )),
            cardColor: AppConst.primary,
            highlightColor: AppConst.primary,
            splashColor: AppConst.primary,
            primaryColor: AppConst.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: createMaterialColor(AppConst.primary),
            ).copyWith(background: AppConst.primary)),
      );
}
