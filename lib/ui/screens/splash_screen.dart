import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:islamy_application/ui/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.of(context).pushNamed(HomeScreen.routeName));

    return Image.asset(
      AppImages.splashBgDark,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
