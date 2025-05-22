import 'package:flutter/material.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/features/theme/selector/theme_selector.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ThemeSelector()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Positioned(
              child: Image.asset('assets/images/logo/splashlogo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
