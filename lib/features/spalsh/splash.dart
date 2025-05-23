import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/features/auth/cubit/auth_cubit.dart';
import 'package:hushin/features/theme/selector/theme_selector.dart';
import 'package:hushin/pages/home/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      final isAuth = context.read<AuthCubit>().state.isAuth;
      if (isAuth) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ThemeSelector()),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.25,
            right: width * 0.1,
            left: width * 0.001,
            child: Image.asset(
              'assets/images/logo/splashlogo.png',
              height: 400,
              width: 400,
            ),
          ),
        ],
      ),
    );
  }
}
