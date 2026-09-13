import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';
import '../widgets/counter_controls.dart';

class Phase1Screen extends StatelessWidget {
  const Phase1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phase 1 - BLoC'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: const Center(child: CounterControls()),
    );
  }
}
