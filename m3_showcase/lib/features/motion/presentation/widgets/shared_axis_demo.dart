import 'package:flutter/material.dart';
import '../../domain/entities/motion_demo.dart';

class SharedAxisDemo extends StatefulWidget {
  const SharedAxisDemo({super.key});

  @override
  State<SharedAxisDemo> createState() => _SharedAxisDemoState();
}

class _SharedAxisDemoState extends State<SharedAxisDemo>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  SharedAxisDirection _direction = SharedAxisDirection.horizontal;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
              'Shared Axis Transition',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Spatial relationships between UI elements',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: 16),
            SegmentedButton<SharedAxisDirection>(
              segments: const [
                ButtonSegment(
                  value: SharedAxisDirection.horizontal,
                  label: Text('Horizontal'),
                  icon: Icon(Icons.swap_horiz),
                ),
                ButtonSegment(
                  value: SharedAxisDirection.vertical,
                  label: Text('Vertical'),
                  icon: Icon(Icons.swap_vert),
                ),
                ButtonSegment(
                  value: SharedAxisDirection.scaled,
                  label: Text('Scaled'),
                  icon: Icon(Icons.zoom_in),
                ),
              ],
              selected: {_direction},
              onSelectionChanged: (Set<SharedAxisDirection> newSelection) {
                setState(() {
                  _direction = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _colors.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: _colors[index].withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _colors[index],
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pages,
                            size: 48,
                            color: _colors[index],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Page ${index + 1}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: _colors[index],
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                Text(
                  '${_currentPage + 1} / ${_colors.length}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ElevatedButton(
                  onPressed: _currentPage < _colors.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}