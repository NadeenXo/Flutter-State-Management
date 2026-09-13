import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ToggleTheme>((event, emit) {
      if (state == ThemeMode.light) {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.light);
      }
    });
  }
}
