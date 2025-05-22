import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/data/common/widgets/basicapp_button.dart';
import 'package:hushin/features/spalsh/splash.dart';
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
      body: Container(
        child: Image.asset('assets/images/common/choose.jpg'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Theme Mode',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: IconButton(
                      onPressed: () {
                        themeCubit.updateTheme(ThemeMode.light);
                      },
                      icon: Icon(
                        Icons.sunny,
                        color: AppColors.primarycolor,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: IconButton(
                      onPressed: () {
                        themeCubit.updateTheme(ThemeMode.dark);
                      },
                      icon: Icon(
                        Icons.nightlight,
                        color: AppColors.primarycolor,
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
                  MaterialPageRoute(builder: (_) => Splash()),
                );
              },
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
