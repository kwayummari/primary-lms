import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plms/src/screens/model/homepage.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  _bottomNavigationState createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int index = 0;
  final screens = [
    HomePage(),
    // found(),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      extendBody: true,
      backgroundColor: AppConst.greyContainer,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppConst.greyContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppConst.secondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconContainer(
                      icon: Icon(
                        Icons.home,
                        color: HexColor('#E0AB57'),
                      ),
                      label: 'Home',
                      isOpen: (index == 0),
                      onPress: () => onTabTapped(0),
                    ),
                    IconContainer(
                      icon: Icon(
                        Icons.card_giftcard,
                        color: HexColor('#9A999B'),
                      ),
                      label: 'Gift',
                      isOpen: (index == 1),
                      onPress: () => onTabTapped(1),
                    ),
                    IconContainer(
                      icon: Icon(
                        Icons.heart_broken,
                        color: HexColor('#9A999B'),
                      ),
                      label: 'Heart',
                      isOpen: (index == 2),
                      onPress: () => onTabTapped(2),
                    ),
                    IconContainer(
                      icon: Icon(
                        Icons.heart_broken,
                        color: HexColor('#9A999B'),
                      ),
                      label: 'lock',
                      isOpen: (index == 3),
                      onPress: () => onTabTapped(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTabTapped(int newIndex) {
    if (mounted) {
      setState(() {
        index = newIndex;
      });
    }
  }
}

class IconContainer extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isOpen;
  final Function onPress;
  const IconContainer({
    required this.icon,
    required this.label,
    required this.isOpen,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
            color: isOpen ? HexColor('#FFF2E3') : AppConst.secondary,
            borderRadius: BorderRadius.all(Radius.circular(isOpen ? 20 : 50)),
            border: Border.all(
              color: isOpen ? HexColor('#E0AB57') : HexColor('#9A999B'),
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              if (isOpen)
                AppText(
                  txt: label,
                  size: 13,
                  color: isOpen ? HexColor('#E0AB57') : AppConst.black,
                  family: 'OpenSans',
                ),
            ],
          ),
        ),
      ),
    );  
  }
}
