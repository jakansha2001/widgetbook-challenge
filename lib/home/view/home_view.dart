import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/home/bloc/home_bloc.dart';

/// This page is for HomeView
class HomeView extends StatelessWidget {
  /// Constructor for HomeView
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Oops! Something went wrong'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const CircularProgressIndicator();
          }
          if (state.status == HomeStatus.loaded) {
            return Text(state.output!);
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (input) {
                    context
                        .read<HomeBloc>()
                        .add(InputChangedEvent(input: input));
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(SubmitButtonPressedEvent());
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
