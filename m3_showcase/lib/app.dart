import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'shared/presentation/providers/theme_provider.dart';
import 'app_router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final seedColor = ref.watch(seedColorProvider);
    final useDynamicColor = ref.watch(useDynamicColorProvider);
    final dynamicThemes = ref.watch(dynamicColorProvider);

    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        ThemeData lightTheme;
        ThemeData darkTheme;

        if (useDynamicColor && lightColorScheme != null && darkColorScheme != null) {
          lightTheme = ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          );
          darkTheme = ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          );
        } else {
          lightTheme = AppTheme.lightTheme(seedColor: seedColor);
          darkTheme = AppTheme.darkTheme(seedColor: seedColor);
        }

        return MaterialApp.router(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: appRouter,
        );
      },
    );
  }
}