# Flutter State Management App

A simple Flutter project demonstrating state management using the BLoC pattern and Cubit with the `flutter_bloc` package.

## Features

- Counter using `CounterBloc`
- Increment and decrement events
- Light and dark theme using `ThemeBloc`
- `BlocBuilder` for rebuilding the counter UI
- `BlocListener` for showing SnackBar messages
- `BlocConsumer` for rebuilding UI and listening to state changes
- `CounterCubit` with increment and decrement methods
- Dialog when the counter becomes negative
- SnackBar when the counter reaches `10` or `-10`

## GitHub Repository

Project repository:

https://github.com/NadeenXo/Flutter-State-Management

## Screenshots

All screenshots for the project are available inside the `screenshots/` folder in this repository.

The screenshots include:

- Phase 1 - CounterBloc
- Phase 1 - ThemeBloc light mode
- Phase 1 - ThemeBloc dark mode
- Phase 2 - BlocBuilder
- Phase 2 - BlocListener SnackBar
- Phase 2 - BlocConsumer message
- Phase 3 - CounterCubit
- Phase 3 - Negative counter dialog
- Phase 3 - BlocConsumer at 10

## Project Structure

```text
lib/
├── main.dart
├── blocs/
│   ├── counter/
│   │   ├── counter_bloc.dart
│   │   └── counter_event.dart
│   └── theme/
│       ├── theme_bloc.dart
│       └── theme_event.dart
├── cubits/
│   └── counter_cubit.dart
├── screens/
│   ├── phase1_screen.dart
│   ├── phase2_screen.dart
│   └── final_counter_screen.dart
└── widgets/
    └── counter_controls.dart