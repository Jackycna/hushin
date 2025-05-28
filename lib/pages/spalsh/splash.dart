import 'package:flutter/material.dart';
import 'package:hushin/core/appimages/app_image.dart';
import 'package:hushin/pages/getstarted/get_started.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => GetStarted()),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: height * 0.25,
              right: width * 0.1,
              left: width * 0.001,
              child: Image.asset(AppImage.logoImage, height: 400, width: 400),
            ),
          ],
        ),
      ),
    );
  }
}
