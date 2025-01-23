part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class ThemeEventChange extends ThemeEvent {
  final bool isDark;
  ThemeEventChange(this.isDark);
}
