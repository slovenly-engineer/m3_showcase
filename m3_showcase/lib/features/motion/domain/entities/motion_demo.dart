import 'package:flutter/material.dart';

enum MotionType {
  easing,
  duration,
  containerTransform,
  sharedAxis,
  fadeThrough,
}

enum EasingType {
  standard,
  accelerate,
  decelerate,
  emphasized,
}

enum DurationType {
  short,
  medium,
  long,
}

enum SharedAxisDirection {
  horizontal,
  vertical,
  scaled,
}

class MotionDemo {
  final String id;
  final String title;
  final String description;
  final MotionType type;
  final IconData icon;

  const MotionDemo({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.icon,
  });
}

class EasingDemo {
  final EasingType type;
  final String name;
  final String description;
  final Curve curve;

  const EasingDemo({
    required this.type,
    required this.name,
    required this.description,
    required this.curve,
  });
}

class DurationDemo {
  final DurationType type;
  final String name;
  final String description;
  final Duration duration;

  const DurationDemo({
    required this.type,
    required this.name,
    required this.description,
    required this.duration,
  });
}