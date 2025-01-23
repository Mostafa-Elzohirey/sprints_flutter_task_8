import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_snackbar.dart';
import 'managers/counter manager/counter_bloc.dart';
import 'managers/theme manager/theme_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: [
          Icon(Icons.light_mode),
          Switch(
            value: themeBloc.state == ThemeMode.dark,
            onChanged: (value) {
              themeBloc.add(ThemeEventChange(value));
            },
          ),
          Icon(Icons.dark_mode),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter % 5 == 0 && state.counter != 0) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      state.counter.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  // Spacer(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            //reset button
            onPressed: () {
              counterBloc.add(CounterEventReset());
            },
            child: const Icon(Icons.undo),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            //increment button
            onPressed: () {
              counterBloc.add(CounterEventIncrement());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            //decrement button
            onPressed: () {
              counterBloc.add(CounterEventDecrement());
            },
            child: const Icon(Icons.minimize),
          )
        ],
      ),
    );
  }
}
