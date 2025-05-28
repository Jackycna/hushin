import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/appimages/app_image.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/core/common/widgets/basicapp_button.dart';
import 'package:hushin/pages/getstarted/get_started.dart';
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
            top: height * -0.5,
            bottom: 0,
            left: 0,
            right: width * 0.1,

            child: Image.asset(AppImage.chooseImage, fit: BoxFit.contain),
          ),

          Positioned(
            top: height * 0.5,
            left: width * 0.12,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Choose Theme Mode',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                          icon: Icon(Icons.sunny, size: 50),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              moonclick
                                  ? Colors.black.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              sunclick = false;
                              moonclick = true;
                            });
                            themeCubit.updateTheme(ThemeMode.dark);
                          },
                          icon: Icon(Icons.nightlight, size: 50),
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
