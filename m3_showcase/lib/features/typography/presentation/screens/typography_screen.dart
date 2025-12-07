import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return AppScaffold(
      title: AppStrings.typography,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTypeScaleSection(
              context,
              'Display',
              'Display (画面上で最も目立つテキスト)',
              [
                _TypeScaleItem(
                  'Display Large',
                  textTheme.displayLarge,
                  '57sp - ヒーローセクション、数値表示',
                ),
                _TypeScaleItem(
                  'Display Medium',
                  textTheme.displayMedium,
                  '45sp - 主要な見出し、セクションタイトル',
                ),
                _TypeScaleItem(
                  'Display Small',
                  textTheme.displaySmall,
                  '36sp - サブセクション、カード内の大見出し',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypeScaleSection(
              context,
              'Headline',
              'Headline (重要な短いテキスト)',
              [
                _TypeScaleItem(
                  'Headline Large',
                  textTheme.headlineLarge,
                  '32sp - ページタイトル、ダイアログタイトル',
                ),
                _TypeScaleItem(
                  'Headline Medium',
                  textTheme.headlineMedium,
                  '28sp - セクション見出し、重要な情報',
                ),
                _TypeScaleItem(
                  'Headline Small',
                  textTheme.headlineSmall,
                  '24sp - カードタイトル、リスト見出し',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypeScaleSection(
              context,
              'Title',
              'Title (中程度の強調)',
              [
                _TypeScaleItem(
                  'Title Large',
                  textTheme.titleLarge,
                  '22sp - AppBarタイトル、タブタイトル',
                ),
                _TypeScaleItem(
                  'Title Medium',
                  textTheme.titleMedium,
                  '16sp medium - サブタイトル、リストアイテムタイトル',
                ),
                _TypeScaleItem(
                  'Title Small',
                  textTheme.titleSmall,
                  '14sp medium - 小見出し、グループラベル',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypeScaleSection(
              context,
              'Body',
              'Body (本文テキスト)',
              [
                _TypeScaleItem(
                  'Body Large',
                  textTheme.bodyLarge,
                  '16sp - 主要コンテンツ、読みやすさ重視',
                ),
                _TypeScaleItem(
                  'Body Medium',
                  textTheme.bodyMedium,
                  '14sp - 標準的な本文、説明文',
                ),
                _TypeScaleItem(
                  'Body Small',
                  textTheme.bodySmall,
                  '12sp - 補足情報、キャプション',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypeScaleSection(
              context,
              'Label',
              'Label (UIコンポーネント用)',
              [
                _TypeScaleItem(
                  'Label Large',
                  textTheme.labelLarge,
                  '14sp medium - ボタンテキスト、大きめのラベル',
                ),
                _TypeScaleItem(
                  'Label Medium',
                  textTheme.labelMedium,
                  '12sp medium - 標準的なボタン、チップ',
                ),
                _TypeScaleItem(
                  'Label Small',
                  textTheme.labelSmall,
                  '11sp medium - 小さなボタン、バッジ',
                ),
              ],
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '使用場面別サンプル',
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildUseCaseExample(
                      context,
                      'ニュースアプリ',
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '最新のテクノロジーニュース',
                            style: textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Flutter 3.16がリリースされました。Material Design 3の完全サポートや、新しいウィジェット、パフォーマンスの改善が含まれています。',
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 32),
                    _buildUseCaseExample(
                      context,
                      'ダッシュボード',
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1,234',
                            style: textTheme.displayLarge,
                          ),
                          Text(
                            'アクティブユーザー',
                            style: textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 32),
                    _buildUseCaseExample(
                      context,
                      'フォーム画面',
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ユーザー情報',
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'メールアドレス',
                            style: textTheme.labelMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'example@email.com',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
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

  Widget _buildTypeScaleSection(
    BuildContext context,
    String title,
    String description,
    List<_TypeScaleItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: item.style,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildUseCaseExample(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}

class _TypeScaleItem {
  final String name;
  final TextStyle? style;
  final String description;

  _TypeScaleItem(this.name, this.style, this.description);
}