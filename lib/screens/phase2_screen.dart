import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';
import '../widgets/counter_controls.dart';

class Phase2Screen extends StatelessWidget {
  const Phase2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 2 - BLoC')),
      body: BlocListener<CounterBloc, int>(
        // React to a specific state without rebuilding the UI.
        listener: (context, counterValue) {
          if (counterValue == 2) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Counter reached 2!')));
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const CounterControls(),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              BlocConsumer<CounterBloc, int>(
                // BlocConsumer can both listen to state changes and rebuild UI.
                listener: (context, counterValue) {
                  if (counterValue == 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('BlocConsumer: Counter reached 10!'),
                      ),
                    );
                  }
                },
                builder: (context, counterValue) {
                  return Text(
                    'value: $counterValue',
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
