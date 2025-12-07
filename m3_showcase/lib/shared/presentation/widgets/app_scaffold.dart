import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_strings.dart';
import '../providers/theme_provider.dart';

class AppScaffold extends ConsumerWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const AppScaffold({
    Key? key,
    required this.child,
    required this.title,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          ...?actions,
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              final currentMode = ref.read(themeModeProvider);
              final newMode = currentMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              ref.read(themeModeProvider.notifier).setThemeMode(newMode);
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: _getSelectedIndex(currentRoute),
        onDestinationSelected: (index) {
          Navigator.pop(context);
          _navigateToIndex(context, index);
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text(AppStrings.home),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette),
            label: Text(AppStrings.colorSystem),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.text_fields_outlined),
            selectedIcon: Icon(Icons.text_fields),
            label: Text(AppStrings.typography),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: Text(AppStrings.components),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.animation_outlined),
            selectedIcon: Icon(Icons.animation),
            label: Text(AppStrings.motion),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.devices_outlined),
            selectedIcon: Icon(Icons.devices),
            label: Text(AppStrings.adaptiveDesign),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.tune_outlined),
            selectedIcon: Icon(Icons.tune),
            label: Text(AppStrings.themeEditor),
          ),
        ],
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }

  int _getSelectedIndex(String route) {
    switch (route) {
      case '/':
        return 0;
      case '/color-system':
        return 1;
      case '/typography':
        return 2;
      case '/components':
        return 3;
      case '/motion':
        return 4;
      case '/adaptive-design':
        return 5;
      case '/theme-editor':
        return 6;
      default:
        return 0;
    }
  }

  void _navigateToIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/color-system');
        break;
      case 2:
        context.go('/typography');
        break;
      case 3:
        context.go('/components');
        break;
      case 4:
        context.go('/motion');
        break;
      case 5:
        context.go('/adaptive-design');
        break;
      case 6:
        context.go('/theme-editor');
        break;
    }
  }
}