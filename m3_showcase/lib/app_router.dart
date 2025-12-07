import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/color_system/presentation/screens/color_system_screen.dart';
import 'features/typography/presentation/screens/typography_screen.dart';
import 'features/components_gallery/presentation/screens/components_gallery_screen.dart';
import 'features/motion/presentation/screens/motion_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/color-system',
      builder: (context, state) => const ColorSystemScreen(),
    ),
    GoRoute(
      path: '/typography',
      builder: (context, state) => const TypographyScreen(),
    ),
    GoRoute(
      path: '/components',
      builder: (context, state) => const ComponentsGalleryScreen(),
    ),
    GoRoute(
      path: '/motion',
      builder: (context, state) => const MotionScreen(),
    ),
    GoRoute(
      path: '/adaptive-design',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Adaptive Design (実装予定)'),
        ),
      ),
    ),
    GoRoute(
      path: '/theme-editor',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Theme Editor (実装予定)'),
        ),
      ),
    ),
  ],
);