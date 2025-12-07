import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class AppTheme {
  static const _defaultSeedColor = Color(0xFF6750A4);

  static ThemeData lightTheme({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor ?? _defaultSeedColor,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData darkTheme({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor ?? _defaultSeedColor,
        brightness: Brightness.dark,
      ),
    );
  }

  static Future<(ThemeData light, ThemeData dark)> getDynamicThemes() async {
    try {
      final corePalette = await DynamicColorPlugin.getCorePalette();
      if (corePalette != null) {
        final lightScheme = corePalette.toColorScheme(brightness: Brightness.light);
        final darkScheme = corePalette.toColorScheme(brightness: Brightness.dark);
        
        return (
          ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
          ),
          ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
          ),
        );
      }
    } catch (e) {
      debugPrint('Dynamic color not available: $e');
    }
    
    return (lightTheme(), darkTheme());
  }
}