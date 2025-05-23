import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/features/theme/cubit/theme_cubit.dart';

class ToogleBar extends StatelessWidget {
  const ToogleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    return CupertinoSlidingSegmentedControl<ThemeMode>(
      groupValue: themeMode,
      backgroundColor: AppColors.primarycolor,
      children: const {
        ThemeMode.light: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.light_mode), SizedBox(width: 4), Text('Light')],
        ),

        ThemeMode.dark: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.dark_mode), SizedBox(width: 4), Text('Dark')],
        ),
      },
      onValueChanged: (mode) {
        if (mode != null) {
          context.read<ThemeCubit>().emit(mode);
        }
      },
    );
  }
}
