import 'package:bloc_flutter/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_flutter/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text("Connected!");
              } else if (state is InternetLostState) {
                return const Text("Not Connected!");
              } else {
                return const Text("Loading!");
              }
            },
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Connected")));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Not Connected")));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Loading")));
              }
            },
          ),
        ),
      ),
    );
  }
}
