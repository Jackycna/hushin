import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/features/theme/cubit/theme_cubit.dart';
import 'package:lottie/lottie.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Lottie.asset(
              'assets/animation/themepage.json',
              height: 200,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Which Theme Will You Prefer',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    themeCubit.setLightTheme();
                  },
                  child: Icon(Icons.wb_sunny),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    themeCubit.setDarkTheme();
                  },
                  child: Icon(Icons.nights_stay),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
