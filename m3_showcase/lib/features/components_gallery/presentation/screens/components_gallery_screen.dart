import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/presentation/widgets/app_scaffold.dart';
import '../widgets/button_showcase.dart';
import '../widgets/card_showcase.dart';
import '../widgets/navigation_showcase.dart';
import '../widgets/input_showcase.dart';

class ComponentsGalleryScreen extends StatefulWidget {
  const ComponentsGalleryScreen({Key? key}) : super(key: key);

  @override
  State<ComponentsGalleryScreen> createState() => _ComponentsGalleryScreenState();
}

class _ComponentsGalleryScreenState extends State<ComponentsGalleryScreen> {
  int _selectedCategory = 0;
  
  final _categories = [
    'ボタン',
    'カード',
    'ナビゲーション',
    '入力',
  ];
  
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.components,
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedCategory,
            onDestinationSelected: (index) {
              setState(() {
                _selectedCategory = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: _categories.map((category) {
              IconData icon;
              switch (category) {
                case 'ボタン':
                  icon = Icons.smart_button;
                  break;
                case 'カード':
                  icon = Icons.credit_card;
                  break;
                case 'ナビゲーション':
                  icon = Icons.navigation;
                  break;
                case '入力':
                  icon = Icons.input;
                  break;
                default:
                  icon = Icons.widgets;
              }
              return NavigationRailDestination(
                icon: Icon(icon),
                label: Text(category),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildContent() {
    switch (_selectedCategory) {
      case 0:
        return const ButtonShowcase();
      case 1:
        return const CardShowcase();
      case 2:
        return const NavigationShowcase();
      case 3:
        return const InputShowcase();
      default:
        return const ButtonShowcase();
    }
  }
}