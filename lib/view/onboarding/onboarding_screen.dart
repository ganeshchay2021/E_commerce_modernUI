import 'package:e_commerce_modernui/model/onBoarding_item_model.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: _pageController,
            itemCount: onBoardingitems.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    onBoardingitems[index].image,
                    height: height * 0.4,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    onBoardingitems[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyles.withColor(AppTextstyles.h1,
                        Theme.of(context).textTheme.bodyLarge!.color!),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      onBoardingitems[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!),
                    ),
                  )
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingitems.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 8,
                    width: _currentIndex == index ? 24 : 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[300] : Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (_currentIndex == 0) {
                      _pageController.jumpToPage(onBoardingitems.length - 1);
                    } else {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == 0 ? "Skip" : "previous",
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodyMedium,
                      isDark ? Colors.grey[300]! : Colors.grey[700]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_currentIndex < onBoardingitems.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    _currentIndex < onBoardingitems.length - 1
                        ? "Next"
                        : "Get Started",
                    style: AppTextstyles.withColor(
                      AppTextstyles.bodyMedium,
                      Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
