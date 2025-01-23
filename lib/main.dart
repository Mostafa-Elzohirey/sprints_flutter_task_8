import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprints_flutter_task_8/managers/counter%20manager/counter_bloc.dart';
import 'package:sprints_flutter_task_8/managers/theme%20manager/theme_bloc.dart';
import 'package:sprints_flutter_task_8/theme.dart';

import 'counter_screen_consumer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool darkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: state,
            home: BlocProvider(
              create: (context) => CounterBloc(),
              child: CounterScreenConsumer(),
            ),
          );
        },
      ),
    );
  }
}
