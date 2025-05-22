import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/data/common/widgets/basicapp_button.dart';
import 'package:hushin/features/auth/pages/get_started.dart';
import 'package:hushin/features/theme/cubit/theme_cubit.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  bool sunclick = false;
  bool moonclick = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,

            child: Image.asset(
              'assets/images/common/choose.jpg',
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 3),
            child: Container(color: Colors.black.withOpacity(0.01)),
          ),
          Positioned(
            top: height * 0.15,
            left: width * 0.12,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Choose Theme Mode',
                    style: TextStyle(
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              sunclick
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.3),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              sunclick = true;
                              moonclick = false;
                            });
                            themeCubit.updateTheme(ThemeMode.light);
                          },
                          icon: Icon(
                            Icons.sunny,
                            color: AppColors.whitecolor,
                            size: 50,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              moonclick
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.3),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              sunclick = false;
                              moonclick = true;
                            });
                            themeCubit.updateTheme(ThemeMode.dark);
                          },
                          icon: Icon(
                            Icons.nightlight,
                            color: AppColors.whitecolor,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BasicappButton(
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => GetStarted()),
                    );
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
