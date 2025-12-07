import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeCard extends StatelessWidget {
  final String name;
  final Color color;
  final Color? onColor;
  final String description;

  const ColorSchemeCard({
    Key? key,
    required this.name,
    required this.color,
    this.onColor,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hexColor = '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
    
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: hexColor));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$hexColor をコピーしました'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: onColor != null
                    ? Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: onColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          hexColor,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'monospace',
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.copy,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}