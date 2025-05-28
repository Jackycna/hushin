import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/features/navigatonbar/navigation_cubit.dart';
import 'package:hushin/features/navigatonbar/navigation_state.dart';
import 'package:hushin/pages/callspage/calls_page.dart';
import 'package:hushin/pages/profile/profile_page.dart';
import 'package:hushin/pages/root/root_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          switch (state.index) {
            case 0:
              return RootPage();
            case 1:
              return CallsPage();
            case 2:
              return ProfilePage();
          }
          return SizedBox();
        },
      ),

      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline),
                label: 'chats',
                selectedIcon: Icon(Icons.chat),
              ),
              NavigationDestination(
                icon: Icon(Icons.call_end_outlined),
                label: 'Calls',
                selectedIcon: Icon(Icons.call),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
                selectedIcon: Icon(Icons.person),
              ),
            ],
            selectedIndex: state.index,
            onDestinationSelected:
                (value) => context.read<NavigationCubit>().selectedIndex(value),
          );
        },
      ),
    );
  }
}
