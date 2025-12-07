import 'package:flutter/material.dart';

class ButtonShowcase extends StatelessWidget {
  const ButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ボタンコンポーネント',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          
          _buildButtonSection(
            context,
            'Elevated Button',
            '影付きで最も目立つボタン。完了、購入、送信などの最重要アクション。',
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('With Icon'),
                ),
                const SizedBox(height: 8),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Filled Button',
            '塗りつぶしで高い視認性。主要アクション、CTAボタン。',
            Column(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('Filled Button'),
                ),
                const SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('With Icon'),
                ),
                const SizedBox(height: 8),
                const FilledButton(
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Filled Tonal Button',
            'SecondaryContainerカラーで柔らかい印象。中程度の重要度。',
            Column(
              children: [
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Text('Filled Tonal'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('下書き保存'),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Outlined Button',
            '枠線のみで控えめな存在感。キャンセル、戻る、代替オプション。',
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Outlined Button'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('戻る'),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Text Button',
            '最も控えめ、テキストのみ。ダイアログ、インラインリンク、低優先度アクション。',
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                  label: const Text('詳細を見る'),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Icon Button',
            'アイコンのみのボタン。ツールバー、お気に入り、共有、設定。',
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
          
          _buildButtonSection(
            context,
            'Segmented Button',
            '相互排他的な選択肢をグループ化。ビュー切り替え、フィルター、並び順。',
            SegmentedButtonExample(),
          ),
          
          _buildButtonSection(
            context,
            'Floating Action Button',
            '画面の主要アクション。新規作成、追加。',
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton.large(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FloatingActionButton.extended(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('新規作成'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildButtonSection(BuildContext context, String title, String description, Widget content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }
}

class SegmentedButtonExample extends StatefulWidget {
  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  Set<String> _selected = {'day'};
  
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(
          value: 'day',
          label: Text('Day'),
          icon: Icon(Icons.calendar_today),
        ),
        ButtonSegment(
          value: 'week',
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment(
          value: 'month',
          label: Text('Month'),
          icon: Icon(Icons.calendar_month),
        ),
      ],
      selected: _selected,
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          _selected = newSelection;
        });
      },
    );
  }
}