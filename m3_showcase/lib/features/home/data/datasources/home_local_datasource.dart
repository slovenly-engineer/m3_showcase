import 'package:flutter/material.dart';
import '../../domain/entities/feature_item.dart';

class HomeLocalDataSource {
  List<FeatureItem> getFeatures() {
    return const [
      FeatureItem(
        id: 'color_system',
        title: 'カラーシステム',
        description: 'Material Design 3のColorSchemeとDynamic Colorを体験',
        icon: Icons.palette,
        route: '/color-system',
      ),
      FeatureItem(
        id: 'typography',
        title: 'タイポグラフィ',
        description: 'Type Scaleと文字スタイルのガイドライン',
        icon: Icons.text_fields,
        route: '/typography',
      ),
      FeatureItem(
        id: 'components',
        title: 'コンポーネント',
        description: 'ボタン、カード、ナビゲーションなどのUI要素',
        icon: Icons.widgets,
        route: '/components',
      ),
      FeatureItem(
        id: 'motion',
        title: 'モーション',
        description: 'アニメーションとトランジションの原則',
        icon: Icons.animation,
        route: '/motion',
      ),
      FeatureItem(
        id: 'adaptive_design',
        title: 'アダプティブデザイン',
        description: 'レスポンシブなレイアウトとブレークポイント',
        icon: Icons.devices,
        route: '/adaptive-design',
      ),
      FeatureItem(
        id: 'theme_editor',
        title: 'テーマエディター',
        description: 'カスタムテーマの作成とプレビュー',
        icon: Icons.tune,
        route: '/theme-editor',
      ),
    ];
  }
}