import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../shared/presentation/providers/theme_provider.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../../../../shared/presentation/widgets/theme_mode_switch.dart';
import '../widgets/color_scheme_card.dart';
import '../widgets/seed_color_picker.dart';
import '../widgets/text_color_hierarchy_demo.dart';

class ColorSystemScreen extends ConsumerWidget {
  const ColorSystemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final useDynamicColor = ref.watch(useDynamicColorProvider);

    return AppScaffold(
      title: AppStrings.colorSystem,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'テーマモード',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const ThemeModeSwitch(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Dynamic Color',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 8),
                        Switch(
                          value: useDynamicColor,
                          onChanged: (value) {
                            ref
                                .read(useDynamicColorProvider.notifier)
                                .setUseDynamicColor(value);
                          },
                        ),
                      ],
                    ),
                    if (!useDynamicColor) ...[
                      const SizedBox(height: 16),
                      const SeedColorPicker(),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'ColorScheme',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Primary Colors',
              [
                _ColorInfo('primary', colorScheme.primary,
                    colorScheme.onPrimary, 'ブランドカラー、主要なアクション'),
                _ColorInfo('primaryContainer', colorScheme.primaryContainer,
                    colorScheme.onPrimaryContainer, '柔らかい表現、選択状態'),
                _ColorInfo('primaryFixed', colorScheme.primaryFixed,
                    colorScheme.onPrimaryFixed, '固定プライマリカラー'),
                _ColorInfo('primaryFixedDim', colorScheme.primaryFixedDim,
                    colorScheme.onPrimaryFixedVariant, '暗い固定プライマリカラー'),
                _ColorInfo('inversePrimary', colorScheme.inversePrimary, null,
                    '反転時のプライマリカラー'),
              ],
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Secondary Colors',
              [
                _ColorInfo('secondary', colorScheme.secondary,
                    colorScheme.onSecondary, '補助的なアクション'),
                _ColorInfo('secondaryContainer', colorScheme.secondaryContainer,
                    colorScheme.onSecondaryContainer, 'チップ、フィルター'),
                _ColorInfo('secondaryFixed', colorScheme.secondaryFixed,
                    colorScheme.onSecondaryFixed, '固定セカンダリカラー'),
                _ColorInfo('secondaryFixedDim', colorScheme.secondaryFixedDim,
                    colorScheme.onSecondaryFixedVariant, '暗い固定セカンダリカラー'),
              ],
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Tertiary Colors',
              [
                _ColorInfo('tertiary', colorScheme.tertiary,
                    colorScheme.onTertiary, 'アクセント、バランス調整'),
                _ColorInfo('tertiaryContainer', colorScheme.tertiaryContainer,
                    colorScheme.onTertiaryContainer, 'リンク、追加的な強調'),
                _ColorInfo('tertiaryFixed', colorScheme.tertiaryFixed,
                    colorScheme.onTertiaryFixed, '固定ターシャリカラー'),
                _ColorInfo('tertiaryFixedDim', colorScheme.tertiaryFixedDim,
                    colorScheme.onTertiaryFixedVariant, '暗い固定ターシャリカラー'),
              ],
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Error Colors',
              [
                _ColorInfo('error', colorScheme.error, colorScheme.onError,
                    'エラー状態、警告'),
                _ColorInfo('errorContainer', colorScheme.errorContainer,
                    colorScheme.onErrorContainer, '削除アクション'),
              ],
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Surface Colors',
              [
                _ColorInfo('surface', colorScheme.surface,
                    colorScheme.onSurface, 'アプリ全体の背景'),
                _ColorInfo('surfaceBright', colorScheme.surfaceBright,
                    colorScheme.onSurface, '明るいサーフェス'),
                _ColorInfo('surfaceDim', colorScheme.surfaceDim,
                    colorScheme.onSurface, '暗いサーフェス'),
                _ColorInfo('surfaceContainer', colorScheme.surfaceContainer,
                    colorScheme.onSurface, 'コンテナの基本サーフェス'),
                _ColorInfo(
                    'surfaceContainerLowest',
                    colorScheme.surfaceContainerLowest,
                    colorScheme.onSurface,
                    '最も薄いコンテナサーフェス'),
                _ColorInfo(
                    'surfaceContainerLow',
                    colorScheme.surfaceContainerLow,
                    colorScheme.onSurface,
                    '薄いコンテナサーフェス'),
                _ColorInfo(
                    'surfaceContainerHigh',
                    colorScheme.surfaceContainerHigh,
                    colorScheme.onSurface,
                    '濃いコンテナサーフェス'),
                _ColorInfo(
                    'surfaceContainerHighest',
                    colorScheme.surfaceContainerHighest,
                    colorScheme.onSurface,
                    '最も濃いコンテナサーフェス'),
                _ColorInfo('inverseSurface', colorScheme.inverseSurface,
                    colorScheme.onInverseSurface, '反転時のサーフェス'),
                _ColorInfo('onSurfaceVariant', colorScheme.onSurfaceVariant,
                    null, 'サーフェス上のバリエーションテキスト'),
                _ColorInfo('surfaceTint', colorScheme.surfaceTint,
                    null, 'サーフェスの色調'),
              ],
            ),
            const SizedBox(height: 16),
            _buildColorSection(
              context,
              'Outline & Effects',
              [
                _ColorInfo('outline', colorScheme.outline, null, '境界線'),
                _ColorInfo('outlineVariant', colorScheme.outlineVariant, null,
                    '薄い境界線'),
                _ColorInfo('shadow', colorScheme.shadow, null, 'シャドウ'),
                _ColorInfo('scrim', colorScheme.scrim, null, 'スクリム'),
              ],
            ),
            const SizedBox(height: 24),
            const TextColorHierarchyDemo(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection(
      BuildContext context, String title, List<_ColorInfo> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...colors.map((colorInfo) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ColorSchemeCard(
                name: colorInfo.name,
                color: colorInfo.color,
                onColor: colorInfo.onColor,
                description: colorInfo.description,
              ),
            )),
      ],
    );
  }
}

class _ColorInfo {
  final String name;
  final Color color;
  final Color? onColor;
  final String description;

  _ColorInfo(this.name, this.color, this.onColor, this.description);
}
