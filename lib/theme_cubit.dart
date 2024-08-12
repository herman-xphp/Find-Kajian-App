import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light());

  void toggleTheme() {
    if (state.isDarkMode) {
      print('light');
      emit(ThemeState.light());
    } else {
      print('dark');
      emit(ThemeState.dark());
    }
  }
}
