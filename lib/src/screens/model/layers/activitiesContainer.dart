import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plms/src/sharedPreferences/sharedData.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';

class ActivitiesContainer extends StatefulWidget {
  const ActivitiesContainer({super.key});

  @override
  State<ActivitiesContainer> createState() => _ActivitiesContainerState();
}

class _ActivitiesContainerState extends State<ActivitiesContainer> {
  SharedData sharedData = SharedData();
  TextEditingController search = TextEditingController();
  String username = '';
  String phone = '';
  String role_id = '';
  String user_id = '';
  void shareData() async {
    Map<String, String?> userData = await sharedData.getData();
    setState(() {
      username = userData['username'] ?? '';
      phone = userData['phone'] ?? '';
      role_id = userData['role_id'] ?? '';
      user_id = userData['user_id'] ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    shareData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppConst.greyContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppConst.secondary,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: 'Activities',
                          size: 20,
                          color: AppConst.black,
                        ),
                        AppText(
                          txt: 'View all',
                          size: 20,
                          color: AppConst.black,
                          family: 'OpenSans',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconContainer(
                          backgroundColor: HexColor('#FFF2E1'),
                          borderColor: AppConst.subprimary,
                          icon: Icon(
                            Icons.newspaper,
                            size: 30,
                            color: HexColor('#DBA857'),
                          ),
                          label: 'Examinations',
                        ),
                        IconContainer(
                          backgroundColor: HexColor('#FEEFE6'),
                          borderColor: HexColor('#DDA57A'),
                          icon: Icon(
                            Icons.history_edu,
                            size: 30,
                            color: HexColor('#DDA57A'),
                          ),
                          label: 'Assignment',
                        ),
                        IconContainer(
                          backgroundColor: HexColor('#FAF8E7'),
                          borderColor: HexColor('#DBA857'),
                          icon: Icon(
                            Icons.graphic_eq,
                            size: 30,
                            color: HexColor('#DBA857'),
                          ),
                          label: 'Assignment',
                        ),
                        IconContainer(
                          backgroundColor: HexColor('#F9FBEA'),
                          borderColor: HexColor('#9DB784'),
                          icon: Icon(
                            Icons.message,
                            size: 30,
                            color: HexColor('#9DB784'),
                          ),
                          label: 'Discussions',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Icon icon;
  final String label;
  const IconContainer(
      {required this.backgroundColor,
      required this.borderColor,
      required this.icon,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
            child: icon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppText(
            txt: label,
            size: 13,
            color: AppConst.black,
            family: 'OpenSans',
          ),
        )
      ],
    );
  }
}