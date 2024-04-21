import 'package:flutter/material.dart';
import 'package:plms/src/sharedPreferences/sharedData.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_input_text.dart';
import 'package:plms/src/widgets/custom_rich_text.dart';

class TopContainer extends StatefulWidget {
  const TopContainer({super.key});

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
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
      padding: const EdgeInsets.only(top: 70),
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/kidevu.png',
                        width: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: CustomRichText(
                          text: 'Hey! ',
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'ClashGrotesk'),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${username.toString()} \n',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'ClashGrotesk'),
                            ),
                            TextSpan(
                              text: 'Good morning',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConst.black,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.menu,
                          color: AppConst.black,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 20, right: 20),
                    child: AppInputText(
                        family: 'OpenSans',
                        circle: 20,
                        borderColor: AppConst.greyish,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppConst.black,
                          size: 30,
                        ),
                        label: 'Search by your topic',
                        textfieldcontroller: search,
                        isemail: false,
                        fillcolor: AppConst.greyContainer,
                        obscure: false),
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
