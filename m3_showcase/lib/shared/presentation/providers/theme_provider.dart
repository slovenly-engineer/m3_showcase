import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_theme.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  static const _themeModeKey = 'theme_mode';

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getString(_themeModeKey);
    
    if (savedMode != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedMode,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.toString());
  }
}

final seedColorProvider = StateNotifierProvider<SeedColorNotifier, Color>((ref) {
  return SeedColorNotifier();
});

class SeedColorNotifier extends StateNotifier<Color> {
  SeedColorNotifier() : super(const Color(0xFF6750A4)) {
    _loadSeedColor();
  }

  static const _seedColorKey = 'seed_color';

  Future<void> _loadSeedColor() async {
    final prefs = await SharedPreferences.getInstance();
    final savedColor = prefs.getInt(_seedColorKey);
    
    if (savedColor != null) {
      state = Color(savedColor);
    }
  }

  Future<void> setSeedColor(Color color) async {
    state = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_seedColorKey, color.value);
  }
}

final dynamicColorProvider = FutureProvider<(ThemeData light, ThemeData dark)>((ref) async {
  return await AppTheme.getDynamicThemes();
});

final useDynamicColorProvider = StateNotifierProvider<UseDynamicColorNotifier, bool>((ref) {
  return UseDynamicColorNotifier();
});

class UseDynamicColorNotifier extends StateNotifier<bool> {
  UseDynamicColorNotifier() : super(false) {
    _loadPreference();
  }

  static const _useDynamicColorKey = 'use_dynamic_color';

  Future<void> _loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_useDynamicColorKey) ?? false;
  }

  Future<void> setUseDynamicColor(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_useDynamicColorKey, value);
  }
}