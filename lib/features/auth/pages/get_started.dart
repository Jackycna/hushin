import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/data/common/widgets/basicapp_button.dart';
import 'package:hushin/features/auth/cubit/auth_cubit.dart';
import 'package:hushin/features/spalsh/splash.dart';
import 'package:hushin/features/theme/style/theme_style.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.05,
            left: width * 0.05,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primarycolor,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: height * 0.1,
            child: Container(
              height: height * 0.6,
              width: width,
              child: Image.asset(
                'assets/images/common/get.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.2,
            left: width * 0.3,
            child: BasicappButton(
              onpressed: () {
                context.read<AuthCubit>().createUser();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Splash()),
                );
              },
              title: 'Get Started',
            ),
          ),
        ],
      ),
    );
  }
}
