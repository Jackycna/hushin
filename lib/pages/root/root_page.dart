import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/bloc/user_bloc.dart';
import 'package:hushin/application/state/user__state.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/pages/chat/chat_screen.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});
  final TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: searchcontroller,
              onChanged: (value) {
                context.read<UserBloc>().searchUser(value);
              },
              decoration: InputDecoration(
                hintText: 'search here',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (contect, state) {
                if (state is UserLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaddedState) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return Material(
                        elevation: 5,
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.primarycolor,
                            child: Icon(Icons.person),
                          ),
                          splashColor: AppColors.primarycolor,
                          title: Text(user.name),
                          subtitle: Text(user.email),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ChatScreen(
                                      currentUserId:
                                          FirebaseAuth
                                              .instance
                                              .currentUser!
                                              .uid,
                                      otherUserId: user.uid,
                                      otherUserName: user.name,
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (state is UserErrorState) {
                  return Center(child: Text(state.message));
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
