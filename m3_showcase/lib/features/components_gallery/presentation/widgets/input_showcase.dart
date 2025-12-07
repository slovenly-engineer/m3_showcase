import 'package:flutter/material.dart';

class InputShowcase extends StatefulWidget {
  const InputShowcase({Key? key}) : super(key: key);

  @override
  State<InputShowcase> createState() => _InputShowcaseState();
}

class _InputShowcaseState extends State<InputShowcase> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  String _radioValue = 'option1';
  double _sliderValue = 50;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '入力コンポーネント',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          
          _buildInputSection(
            context,
            'Text Field',
            'テキスト入力。Filledは単独、Outlinedはフォーム向け。',
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Filled Text Field',
                    hintText: 'テキストを入力',
                    helperText: 'ヘルパーテキスト',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Outlined Text Field',
                    hintText: 'テキストを入力',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Error State',
                    errorText: 'エラーメッセージ',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          
          _buildInputSection(
            context,
            'Checkbox',
            '複数選択、独立したオプション',
            Column(
              children: [
                CheckboxListTile(
                  title: const Text('チェックボックス'),
                  subtitle: const Text('複数選択可能'),
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
                const CheckboxListTile(
                  title: Text('無効状態'),
                  value: false,
                  onChanged: null,
                ),
              ],
            ),
          ),
          
          _buildInputSection(
            context,
            'Radio Button',
            '単一選択、相互排他的',
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('オプション 1'),
                  value: 'option1',
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('オプション 2'),
                  value: 'option2',
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('オプション 3'),
                  value: 'option3',
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          
          _buildInputSection(
            context,
            'Switch',
            'オン/オフ、即座に反映される設定',
            Column(
              children: [
                SwitchListTile(
                  title: const Text('Switch'),
                  subtitle: const Text('設定のオン/オフ'),
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                const SwitchListTile(
                  title: Text('無効状態'),
                  value: false,
                  onChanged: null,
                ),
              ],
            ),
          ),
          
          _buildInputSection(
            context,
            'Slider',
            '滑らかな値の選択（音量、明度）',
            Column(
              children: [
                Text('値: ${_sliderValue.round()}'),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                const Slider(
                  value: 50,
                  min: 0,
                  max: 100,
                  onChanged: null,
                ),
              ],
            ),
          ),
          
          _buildInputSection(
            context,
            'Date Picker',
            '日付選択。Modal、Docked、Input形式。',
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('日付を選択'),
                  subtitle: Text('${_selectedDate.year}年${_selectedDate.month}月${_selectedDate.day}日'),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('時刻を選択'),
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildInputSection(BuildContext context, String title, String description, Widget content) {
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