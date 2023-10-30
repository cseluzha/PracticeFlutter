import 'package:flutter/material.dart';

// If you neet to put a color with hex decimal form need put first this: 0xFF

const Color _customColor = Color(0xFF5C11D4);

const List<Color> colorThemes = [
  _customColor,
  Colors.teal,
  Colors.blue,
  Colors.red,
  Colors.amber,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  }) : assert(selectedColor >= 0 && selectedColor <= colorThemes.length - 1,
            'Colors be between 0 and ${colorThemes.length}');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorThemes[selectedColor],
      // Global configuration for all appBar into the app.
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
