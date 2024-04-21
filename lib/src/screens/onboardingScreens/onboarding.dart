import 'package:flutter/material.dart';
import 'package:plms/src/widgets/app_base_screen.dart';
import 'onboarding_page.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  late PageController _pageController;
  int _currentPage = 0;

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

  final screens = [
    {
      'asset': 'assets/screen1.png',
      'title': 'Welcome to Online Primary LMS',
      'subtitle': 'Here you can learn new and most interesting things'
    },
    {
      'asset': 'assets/screen2.png',
      'title': 'Welcome to Online Primary LMS',
      'subtitle': 'Here you can learn new and most interesting things'
    },
    {
      'asset': 'assets/screen3.png',
      'title': 'Welcome to Online Primary LMS',
      'subtitle': 'Here you can learn new and most interesting things'
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
              child: buildPage(screens[index], index, context, setPage),
            );
          },
        ),
      ),
    );
  }
}
