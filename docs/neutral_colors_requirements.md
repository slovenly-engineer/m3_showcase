# Material Design 3 ニュートラル/ニュートラルバリアント 要件定義書

## 1. 概要

### 1.1 目的
Material Design 3における「ニュートラル（Neutral）」と「ニュートラルバリアント（NeutralVariant）」トーナルパレットの理解とFlutterアプリケーションでの実装方法を定義する。

### 1.2 背景
Material Design 3（Material You）では、5つの主要なトーナルパレットが使用される：
- Primary
- Secondary  
- Tertiary
- **Neutral**
- **NeutralVariant**

ニュートラル系カラーは、アプリの背景、サーフェス、境界線など、コンテンツを支える基盤的な色として機能する。

## 2. ニュートラル/ニュートラルバリアントの定義

### 2.1 ニュートラル（Neutral）
- **役割**: 主要な背景色、サーフェス色として使用
- **特徴**: 彩度が低く（Chroma: 6）、トーン0-100の範囲で明度を調整
- **使用例**: カード背景、シート、メニュー背景、アプリ全体の背景

### 2.2 ニュートラルバリアント（NeutralVariant）
- **役割**: 境界線、アウトライン、サーフェスのバリエーションとして使用
- **特徴**: ニュートラルよりわずかに彩度が高い
- **使用例**: outline、outlineVariant、onSurfaceVariant

## 3. Flutterでの実装方法

### 3.1 必要パッケージ
```yaml
dependencies:
  material_color_utilities: ^0.8.0
  dynamic_color: ^1.7.0
```

### 3.2 CorePaletteを使用した実装

#### 基本的な実装例
```dart
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:dynamic_color/dynamic_color.dart';

class Material3ColorGenerator {
  static ThemeData generateTheme({
    required Color primaryColor,
    required Color secondaryColor,
    required Color tertiaryColor,
    required Color neutralColor,
    required Color neutralVariantColor,
    required Brightness brightness,
  }) {
    // 各色をトーナルパレットに変換
    List<int> colors = <int>[
      ...toTonalPalette(primaryColor).asList,
      ...toTonalPalette(secondaryColor).asList,
      ...toTonalPalette(tertiaryColor).asList,
      ...toTonalPalette(neutralColor).asList,
      ...toTonalPalette(neutralVariantColor).asList,
    ];
    
    // CorePaletteから ColorScheme を生成
    ColorScheme colorScheme = CorePaletteToColorScheme(
      CorePalette.fromList(colors)
    ).toColorScheme(brightness: brightness);
    
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
    );
  }
  
  static TonalPalette toTonalPalette(Color color) {
    final hctColor = Hct.fromInt(color.value);
    return TonalPalette.of(hctColor.hue, hctColor.chroma);
  }
}
```

#### 特定のトーンにアクセスする拡張メソッド
```dart
extension Material3TonalAccess on Color {
  /// 指定したトーン（0-100）の色を取得
  Color tone(int tone) {
    assert(tone >= 0 && tone <= 100);
    final hctColor = Hct.fromInt(value);
    final tonalPalette = TonalPalette.of(hctColor.hue, hctColor.chroma);
    return Color(tonalPalette.get(tone));
  }
  
  /// ニュートラルパレットを生成（低彩度）
  TonalPalette get neutralPalette {
    final hctColor = Hct.fromInt(value);
    return TonalPalette.of(hctColor.hue, 6); // Chroma: 6 for neutral
  }
  
  /// ニュートラルバリアントパレットを生成
  TonalPalette get neutralVariantPalette {
    final hctColor = Hct.fromInt(value);
    return TonalPalette.of(hctColor.hue, 8); // Slightly higher chroma
  }
}
```

### 3.3 実用的な使用例

#### カスタムサーフェス色の生成
```dart
class CustomSurfaceColors {
  final TonalPalette neutralPalette;
  final TonalPalette neutralVariantPalette;
  
  CustomSurfaceColors({
    required Color seedColor,
  }) : neutralPalette = seedColor.neutralPalette,
        neutralVariantPalette = seedColor.neutralVariantPalette;
  
  // ライトモード用サーフェス色
  Color get lightSurface => Color(neutralPalette.get(98));
  Color get lightSurfaceContainer => Color(neutralPalette.get(94));
  Color get lightOutline => Color(neutralVariantPalette.get(50));
  
  // ダークモード用サーフェス色
  Color get darkSurface => Color(neutralPalette.get(6));
  Color get darkSurfaceContainer => Color(neutralPalette.get(12));
  Color get darkOutline => Color(neutralVariantPalette.get(60));
}
```

## 4. 実装要件

### 4.1 機能要件
1. **トーナルパレット生成機能**
   - 任意のシードカラーからニュートラル/ニュートラルバリアントパレットを生成
   - 0-100の範囲でトーン値を指定して色を取得

2. **ColorScheme統合機能**
   - 生成したニュートラル色をFlutterのColorSchemeに適用
   - ライト/ダークテーマの自動切り替え対応

3. **カスタムサーフェス色機能**
   - アプリ固有のサーフェス色をニュートラルパレットから生成
   - 階層構造（elevation）に応じた色の自動調整

### 4.2 非機能要件
1. **パフォーマンス**
   - トーナルパレット生成は起動時に1回のみ実行
   - 生成した色はキャッシュして再利用

2. **アクセシビリティ**
   - WCAG 2.1 AA準拠のコントラスト比を維持
   - ニュートラル色とテキスト色の適切なコントラスト確保

3. **互換性**
   - Flutter 3.10以降で動作
   - Material Design 3仕様に準拠

## 5. 使用シナリオ

### 5.1 基本的なテーマ実装
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material 3 Neutral Colors Demo',
      theme: Material3ColorGenerator.generateTheme(
        primaryColor: Colors.blue,
        secondaryColor: Colors.teal,
        tertiaryColor: Colors.amber,
        neutralColor: Colors.grey,
        neutralVariantColor: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      darkTheme: Material3ColorGenerator.generateTheme(
        primaryColor: Colors.blue,
        secondaryColor: Colors.teal,
        tertiaryColor: Colors.amber,
        neutralColor: Colors.grey,
        neutralVariantColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: ColorShowcaseScreen(),
    );
  }
}
```

### 5.2 動的色変更への対応
```dart
class DynamicThemeProvider extends ChangeNotifier {
  Color _seedColor = Colors.blue;
  
  ThemeData get lightTheme => _generateTheme(Brightness.light);
  ThemeData get darkTheme => _generateTheme(Brightness.dark);
  
  void updateSeedColor(Color newColor) {
    _seedColor = newColor;
    notifyListeners();
  }
  
  ThemeData _generateTheme(Brightness brightness) {
    return Material3ColorGenerator.generateTheme(
      primaryColor: _seedColor,
      secondaryColor: _seedColor.tone(60),
      tertiaryColor: _seedColor.tone(80),
      neutralColor: _seedColor.neutralPalette.get(50),
      neutralVariantColor: _seedColor.neutralVariantPalette.get(50),
      brightness: brightness,
    );
  }
}
```

## 6. テスト要件

### 6.1 単体テスト
- トーナルパレット生成の正確性
- 指定したトーン値での色取得
- HCT色空間での計算精度

### 6.2 視覚的テスト
- ライト/ダークテーマでの色の調和
- 各トーンレベルでのコントラスト比
- 実際のUIコンポーネントでの見栄え

## 7. 成果物

### 7.1 実装ファイル
- `lib/theme/material3_color_generator.dart`
- `lib/theme/neutral_color_extensions.dart`
- `lib/demo/neutral_color_showcase.dart`

### 7.2 ドキュメント
- API仕様書
- 使用方法ガイド
- ベストプラクティス集

## 8. 参考資料

- [Material Design 3 - Color System](https://m3.material.io/styles/color/system/how-the-system-works)
- [Flutter Material Color Utilities](https://api.flutter.dev/flutter/package-material_color_utilities_palettes_core_palette/CorePalette-class.html)
- [Dynamic Color Package](https://pub.dev/packages/dynamic_color)

---

**作成日**: 2025-01-17  
**バージョン**: 1.0  
**担当者**: Claude Code Assistant