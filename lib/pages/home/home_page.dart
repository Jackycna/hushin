import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/data/common/widgets/basicapp_button.dart';
import 'package:hushin/data/common/widgets/toogle_bar.dart';
import 'package:hushin/features/theme/cubit/theme_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.2,
            left: width * 0.01,
            child: Lottie.asset(
              'assets/animation/loading.json',
              height: 400,
              width: 400,
            ),
          ),
          Positioned(
            top: height * 0.07,
            right: width * 0.06,
            child: ToogleBar(),
          ),
          Positioned(
            top: height * 0.7,
            right: width * 0.26,
            child: BasicappButton(onpressed: () {}, title: 'Create Room'),
          ),
          Positioned(
            top: height * 0.8,
            right: width * 0.29,
            child: BasicappButton(onpressed: () {}, title: 'Join Room'),
          ),
        ],
      ),
    );
  }
}
