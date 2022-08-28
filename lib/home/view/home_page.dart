import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/home/bloc/home_bloc.dart';
import 'package:widgetbook_challenge/home/view/home_view.dart';

/// This is Home Page

class HomePage extends StatefulWidget {
  /// Constructor for Home Page
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          widgetbookApi: WidgetbookApi(),
        ),
        child: const HomeView(),
      ),
    );
  }
}
