import 'package:flutter/material.dart';
import 'package:plms/src/screens/enrollment/introduction_page.dart';
import 'package:plms/src/widgets/app_base_screen.dart';

class EnrollmentIntroductionScreen extends StatefulWidget {
  const EnrollmentIntroductionScreen({Key? key}) : super(key: key);

  @override
  State<EnrollmentIntroductionScreen> createState() =>
      _EnrollmentIntroductionScreenState();
}

class _EnrollmentIntroductionScreenState
    extends State<EnrollmentIntroductionScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isAcademia = true;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 1.0);
  }

  void setPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void setIsAcademia(value) {
    setState(() {
      _isAcademia = value;
    });
  }

  final screens = [
    {
      'asset': 'assets/req1.png',
      'title': 'Welcome to plms',
      'subtitle':
          'Our mission is to make you productive, this will only take a minute'
    },
    {
      'asset': 'assets/req2.png',
      'title': 'Personalize your learning needs',
      'subtitle': 'Please select your enrollment category'
    },
    {
      'asset': 'assets/req3.png',
      'title': 'Your fun way to academic literacy',
      'subtitle': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      padding: EdgeInsets.all(0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          controller: _pageController,
          itemCount: screens.length,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (BuildContext context, Widget? child) {
                double value = 1.0;
                if (_pageController.position.haveDimensions) {
                  value = _pageController.page! - index;
                  value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                }
                return Center(
                  child: SizedBox(
                    height: Curves.easeInOut.transform(value) *
                        MediaQuery.of(context).size.height,
                    width: Curves.easeInOut.transform(value) *
                        MediaQuery.of(context).size.width,
                    child: child,
                  ),
                );
              },
              child: introductionPage(screens[index], index, context, setPage,
                  setIsAcademia, _isAcademia),
            );
          },
        ),
      ),
    );
  }
}
