import 'package:flutter/material.dart';

/// Material Design 3のテキスト色階層を示すデモウィジェット
/// 
/// このウィジェットは以下を実演します：
/// - onSurface と onSurfaceVariant の使い分け
/// - 透明度による重要度の表現（100%, 87%, 60%, 38%）
/// - 実際の使用例（タイトル、サブタイトル、本文、キャプション、無効化テキスト）
/// - Material 3のタイポグラフィスタイル
class TextColorHierarchyDemo extends StatelessWidget {
  const TextColorHierarchyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'テキスト色階層 / Text Color Hierarchy',
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Primary text examples with onSurface
            _buildSection(
              context,
              title: 'プライマリテキスト（onSurface）',
              subtitle: 'Primary text using onSurface color',
              examples: [
                _TextExample(
                  label: '100% - 見出し・重要なテキスト',
                  description: 'Headlines, important content',
                  style: textTheme.headlineSmall,
                  color: colorScheme.onSurface,
                  opacity: 1.0,
                ),
                _TextExample(
                  label: '87% - 本文・標準テキスト',
                  description: 'Body text, standard content',
                  style: textTheme.bodyLarge,
                  color: colorScheme.onSurface,
                  opacity: 0.87,
                ),
                _TextExample(
                  label: '60% - セカンダリテキスト',
                  description: 'Secondary information, metadata',
                  style: textTheme.bodyMedium,
                  color: colorScheme.onSurface,
                  opacity: 0.60,
                ),
                _TextExample(
                  label: '38% - ヒント・無効化テキスト',
                  description: 'Hints, disabled text, placeholders',
                  style: textTheme.bodySmall,
                  color: colorScheme.onSurface,
                  opacity: 0.38,
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Surface variant examples
            _buildSection(
              context,
              title: 'サーフェイスバリアント（onSurfaceVariant）',
              subtitle: 'Surface variant for subtle text elements',
              examples: [
                _TextExample(
                  label: '100% - サブタイトル・ラベル',
                  description: 'Subtitles, form labels',
                  style: textTheme.titleMedium,
                  color: colorScheme.onSurfaceVariant,
                  opacity: 1.0,
                ),
                _TextExample(
                  label: '87% - 補助情報',
                  description: 'Supporting information',
                  style: textTheme.bodyMedium,
                  color: colorScheme.onSurfaceVariant,
                  opacity: 0.87,
                ),
                _TextExample(
                  label: '60% - キャプション',
                  description: 'Captions, footnotes',
                  style: textTheme.bodySmall,
                  color: colorScheme.onSurfaceVariant,
                  opacity: 0.60,
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Practical examples section
            _buildPracticalExamples(context),
            
            const SizedBox(height: 24),
            
            // Usage guidelines
            _buildUsageGuidelines(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<_TextExample> examples,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...examples.map((example) => _buildTextExample(context, example)),
      ],
    );
  }

  Widget _buildTextExample(BuildContext context, _TextExample example) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Color indicator
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 12, top: 2),
            decoration: BoxDecoration(
              color: example.color.withValues(alpha: example.opacity),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
          ),
          
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  example.label,
                  style: example.style?.copyWith(
                    color: example.color.withValues(alpha: example.opacity),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  example.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  'Opacity: ${(example.opacity * 100).toInt()}%',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticalExamples(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '実用例 / Practical Examples',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        
        // Example card layout
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title (100% onSurface)
              Text(
                'Material Design 3 Colors',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              
              // Subtitle (onSurfaceVariant)
              Text(
                'カラーシステムの概要',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              
              // Body text (87% onSurface)
              Text(
                'Material Design 3では、動的カラーとコントラストに基づいた包括的なカラーシステムを提供しています。',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.87),
                ),
              ),
              const SizedBox(height: 8),
              
              // Secondary info (60% onSurface)
              Text(
                '更新日: 2024年8月17日',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.60),
                ),
              ),
              const SizedBox(height: 4),
              
              // Caption/disabled (38% onSurface)
              Text(
                'この情報は参考用です',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.38),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsageGuidelines(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '使用ガイドライン / Usage Guidelines',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        
        _buildGuideline(
          context,
          '100% 透明度',
          '最も重要なテキスト（見出し、ボタンラベル）',
          'Most important text (headlines, button labels)',
        ),
        _buildGuideline(
          context,
          '87% 透明度',
          '標準的な本文テキスト',
          'Standard body text for readability',
        ),
        _buildGuideline(
          context,
          '60% 透明度',
          'セカンダリ情報（日時、カウント）',
          'Secondary information (timestamps, counts)',
        ),
        _buildGuideline(
          context,
          '38% 透明度',
          'ヒント、プレースホルダー、無効化テキスト',
          'Hints, placeholders, disabled text',
        ),
      ],
    );
  }

  Widget _buildGuideline(
    BuildContext context,
    String title,
    String japanese,
    String english,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title: $japanese',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.87),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  english,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextExample {
  final String label;
  final String description;
  final TextStyle? style;
  final Color color;
  final double opacity;

  const _TextExample({
    required this.label,
    required this.description,
    required this.style,
    required this.color,
    required this.opacity,
  });
}