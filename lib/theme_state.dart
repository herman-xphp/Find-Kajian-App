part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState._(this.isDarkMode);

  const ThemeState.light() : this._(false);
  const ThemeState.dark() : this._(true);

  @override
  List<Object> get props => [isDarkMode];
}
