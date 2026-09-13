import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_cubit.dart';

class FinalCounterScreen extends StatelessWidget {
  const FinalCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 3 - Counter Cubit')),
      body: BlocListener<CounterCubit, int>(
        // Show a dialog whenever the counter becomes negative.
        listener: (context, counterValue) {
          if (counterValue < 0) {
            showDialog<void>(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('Negative Counter'),
                  content: Text('The counter is now $counterValue.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Counter Value',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Rebuild the counter whenever the Cubit state changes.
              BlocBuilder<CounterCubit, int>(
                builder: (context, counterValue) {
                  return Text(
                    '$counterValue',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: const Text('+'),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              BlocConsumer<CounterCubit, int>(
                // Show a message at 10 and -10.
                listener: (context, counterValue) {
                  if (counterValue == 10 || counterValue == -10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'BlocConsumer: Counter reached $counterValue!',
                        ),
                      ),
                    );
                  }
                },
                builder: (context, counterValue) {
                  return Text(
                    'BlocConsumer value: $counterValue',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
