import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_strings.dart';
import '../providers/theme_provider.dart';

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    
    return SegmentedButton<ThemeMode>(
      segments: const [
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          label: Text(AppStrings.lightMode),
          icon: Icon(Icons.light_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          label: Text(AppStrings.darkMode),
          icon: Icon(Icons.dark_mode),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.system,
          label: Text(AppStrings.systemMode),
          icon: Icon(Icons.settings_brightness),
        ),
      ],
      selected: {themeMode},
      onSelectionChanged: (Set<ThemeMode> newSelection) {
        ref.read(themeModeProvider.notifier).setThemeMode(newSelection.first);
      },
    );
  }
}