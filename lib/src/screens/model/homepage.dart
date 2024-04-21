import 'package:flutter/material.dart';
import 'package:plms/src/screens/model/layers/activitiesContainer.dart';
import 'package:plms/src/screens/model/layers/topContainer.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_base_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        backgroundColor: AppConst.homeBackgroundColor,
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            TopContainer(),
            ActivitiesContainer(),
          ],
        ));
  }
}
