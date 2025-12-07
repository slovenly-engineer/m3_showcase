import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/motion_provider.dart';
import '../widgets/easing_demo_widget.dart';
import '../widgets/duration_demo_widget.dart';
import '../widgets/container_transform_demo.dart';
import '../widgets/shared_axis_demo.dart';
import '../widgets/fade_through_demo.dart';

class MotionScreen extends ConsumerWidget {
  const MotionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final easingDemos = ref.watch(easingDemosProvider);
    final durationDemos = ref.watch(durationDemosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Motion'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material Motion',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Explore Material Design 3 motion principles and animation patterns',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: 24),
            
            EasingDemoWidget(easingDemos: easingDemos),
            const SizedBox(height: 16),
            
            DurationDemoWidget(durationDemos: durationDemos),
            const SizedBox(height: 16),
            
            const ContainerTransformDemo(),
            const SizedBox(height: 16),
            
            const SharedAxisDemo(),
            const SizedBox(height: 16),
            
            const FadeThroughDemo(),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motion Principles',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    const _MotionPrincipleItem(
                      icon: Icons.speed,
                      title: 'Informative',
                      description: 'Motion focuses attention and maintains continuity through subtle feedback.',
                    ),
                    const SizedBox(height: 12),
                    const _MotionPrincipleItem(
                      icon: Icons.tune,
                      title: 'Focused',
                      description: 'Motion supports the information hierarchy by directing attention to what\'s important.',
                    ),
                    const SizedBox(height: 12),
                    const _MotionPrincipleItem(
                      icon: Icons.psychology,
                      title: 'Expressive',
                      description: 'Motion reflects your brand personality through transitions and micro-interactions.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MotionPrincipleItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _MotionPrincipleItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 24,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}