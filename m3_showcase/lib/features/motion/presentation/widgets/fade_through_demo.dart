import 'package:flutter/material.dart';

class FadeThroughDemo extends StatefulWidget {
  const FadeThroughDemo({super.key});

  @override
  State<FadeThroughDemo> createState() => _FadeThroughDemoState();
}

class _FadeThroughDemoState extends State<FadeThroughDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeOutAnimation;
  late Animation<double> _fadeInAnimation;
  
  int _currentIndex = 0;
  final List<Widget> _content = [
    const _ContentWidget(
      icon: Icons.home,
      title: 'Home',
      description: 'Welcome to the home screen',
      color: Colors.blue,
    ),
    const _ContentWidget(
      icon: Icons.search,
      title: 'Search',
      description: 'Find what you are looking for',
      color: Colors.green,
    ),
    const _ContentWidget(
      icon: Icons.settings,
      title: 'Settings',
      description: 'Configure your preferences',
      color: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _switchContent(int newIndex) {
    if (newIndex == _currentIndex) return;

    _controller.forward().then((_) {
      setState(() {
        _currentIndex = newIndex;
      });
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fade Through Transition',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Transitions that emphasize new content',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    children: [
                      if (_fadeOutAnimation.value > 0)
                        Opacity(
                          opacity: _fadeOutAnimation.value,
                          child: _content[_currentIndex],
                        ),
                      if (_fadeInAnimation.value > 0)
                        Opacity(
                          opacity: _fadeInAnimation.value,
                          child: _content[_currentIndex],
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _content.length,
                (index) => ElevatedButton(
                  onPressed: () => _switchContent(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: _currentIndex == index
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  child: Text('Content ${index + 1}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ContentWidget({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}