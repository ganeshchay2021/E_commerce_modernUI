import 'package:e_commerce_modernui/utils/assets.dart';

class OnboardingItemModel {
  final String title;
  final String description;
  final String image;

  OnboardingItemModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingItemModel> onBoardingitems = [
  OnboardingItemModel(
    description: "Explore the newest fashion trends and find your unique style",
    title: "Discover Latest Trends",
    image: Assets.intro,
  ),
  OnboardingItemModel(
    description: "Shop premium quality products from top brands worldwide",
    title: "Quality Product",
    image: Assets.intro1,
  ),
  OnboardingItemModel(
    description: "Simple and secure shopping experience at your fingertips",
    title: "Easy Shopping",
    image: Assets.intro2,
  )
];
