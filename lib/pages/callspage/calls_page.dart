import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/bloc/call_bloc.dart';
import 'package:hushin/application/state/call_state.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer(
          builder: (Context, state) {
            if (state is CallLoading) {
              return CircularProgressIndicator();
            } else if (state is CallLoading) {
              return CircularProgressIndicator();
            } else if (state is CallStarted) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('call in Progress...'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CallBloc>().endcall();
                      Navigator.pop(context);
                    },
                    child: Text('end call'),
                  ),
                ],
              );
            } else if (state is CallEndded) {
              return Text('Call Endded');
            }
            return Text('Ready to call');
          },
          listener: (context, state) {
            if (state is CallError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
