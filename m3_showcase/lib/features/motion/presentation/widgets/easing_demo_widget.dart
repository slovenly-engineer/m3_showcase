import 'package:flutter/material.dart';
import '../../domain/entities/motion_demo.dart';

class EasingDemoWidget extends StatefulWidget {
  final List<EasingDemo> easingDemos;

  const EasingDemoWidget({
    super.key,
    required this.easingDemos,
  });

  @override
  State<EasingDemoWidget> createState() => _EasingDemoWidgetState();
}

class _EasingDemoWidgetState extends State<EasingDemoWidget>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = widget.easingDemos
        .map((demo) => AnimationController(
              duration: const Duration(milliseconds: 1000),
              vsync: this,
            ))
        .toList();

    _animations = widget.easingDemos
        .asMap()
        .entries
        .map((entry) {
          final index = entry.key;
          final demo = entry.value;
          return Tween<double>(
            begin: 0.0,
            end: 200.0,
          ).animate(CurvedAnimation(
            parent: _controllers[index],
            curve: demo.curve,
          ));
        })
        .toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startAnimations() {
    for (final controller in _controllers) {
      controller.reset();
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Easing Curves',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ElevatedButton(
                  onPressed: _startAnimations,
                  child: const Text('Play'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...widget.easingDemos.asMap().entries.map((entry) {
              final index = entry.key;
              final demo = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      demo.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      demo.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AnimatedBuilder(
                        animation: _animations[index],
                        builder: (context, child) {
                          return Stack(
                            children: [
                              Positioned(
                                left: _animations[index].value,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}