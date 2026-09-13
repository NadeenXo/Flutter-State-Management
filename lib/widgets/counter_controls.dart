import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';

class CounterControls extends StatelessWidget {
  const CounterControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<CounterBloc, int>(
          builder: (context, counterValue) {
            return Text(
              '$counterValue',
              style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            );
          },
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              },
              child: const Text('-'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              },
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}
