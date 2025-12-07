import 'package:flutter/material.dart';
import '../../domain/entities/motion_demo.dart';

class MotionLocalDataSource {
  List<MotionDemo> getMotionDemos() {
    return [
      const MotionDemo(
        id: 'easing',
        title: 'Easing',
        description: 'Standard easing curves for Material Motion',
        type: MotionType.easing,
        icon: Icons.timeline,
      ),
      const MotionDemo(
        id: 'duration',
        title: 'Duration',
        description: 'Short, medium, and long duration comparisons',
        type: MotionType.duration,
        icon: Icons.access_time,
      ),
      const MotionDemo(
        id: 'container_transform',
        title: 'Container Transform',
        description: 'Seamless transitions between UI elements',
        type: MotionType.containerTransform,
        icon: Icons.transform,
      ),
      const MotionDemo(
        id: 'shared_axis',
        title: 'Shared Axis',
        description: 'Spatial relationships between UI elements',
        type: MotionType.sharedAxis,
        icon: Icons.swap_horiz,
      ),
      const MotionDemo(
        id: 'fade_through',
        title: 'Fade Through',
        description: 'Transitions that emphasize new content',
        type: MotionType.fadeThrough,
        icon: Icons.blur_on,
      ),
    ];
  }

  List<EasingDemo> getEasingDemos() {
    return [
      const EasingDemo(
        type: EasingType.standard,
        name: 'Standard',
        description: 'Default easing for most animations',
        curve: Curves.easeInOut,
      ),
      const EasingDemo(
        type: EasingType.accelerate,
        name: 'Accelerate',
        description: 'Elements leaving the screen',
        curve: Curves.easeIn,
      ),
      const EasingDemo(
        type: EasingType.decelerate,
        name: 'Decelerate',
        description: 'Elements entering the screen',
        curve: Curves.easeOut,
      ),
      const EasingDemo(
        type: EasingType.emphasized,
        name: 'Emphasized',
        description: 'Important transitions and transformations',
        curve: Curves.easeInOutCubicEmphasized,
      ),
    ];
  }

  List<DurationDemo> getDurationDemos() {
    return [
      const DurationDemo(
        type: DurationType.short,
        name: 'Short (100ms)',
        description: 'Simple icon changes and small movements',
        duration: Duration(milliseconds: 100),
      ),
      const DurationDemo(
        type: DurationType.medium,
        name: 'Medium (250ms)',
        description: 'Standard UI transitions',
        duration: Duration(milliseconds: 250),
      ),
      const DurationDemo(
        type: DurationType.long,
        name: 'Long (500ms)',
        description: 'Complex layout changes and page transitions',
        duration: Duration(milliseconds: 500),
      ),
    ];
  }
}