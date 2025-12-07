import 'package:flutter/material.dart';

/// Material Design 3のセマンティックテキストカラーシステム
/// 
/// 透明度による強調ではなく、セマンティックな色の役割に基づいた
/// 体系的で一貫性のあるテキストカラーの使い分けを提供
class SemanticTextColors {
  final ColorScheme _colorScheme;
  
  const SemanticTextColors(this._colorScheme);
  
  /// 最高強調テキスト - 見出し、重要な情報
  Color get highEmphasis => _colorScheme.onSurface;
  
  /// 中強調テキスト - 説明文、サブタイトル、メタデータ
  Color get mediumEmphasis => _colorScheme.onSurfaceVariant;
  
  /// 無効状態テキスト - 使用不可能な要素
  Color get disabled => _colorScheme.onSurface.withValues(alpha: 0.38);
  
  /// エラーテキスト - エラーメッセージ、警告
  Color get error => _colorScheme.error;
  
  /// プライマリアクション - リンク、重要なアクション
  Color get primaryAction => _colorScheme.primary;
  
  /// セカンダリアクション - 補助的なアクション
  Color get secondaryAction => _colorScheme.secondary;
  
  /// 成功テキスト - 成功メッセージ、完了状態
  Color get success => _colorScheme.tertiary;
  
  /// 警告テキスト - 注意喚起
  Color get warning => _colorScheme.error;
  
  /// プレースホルダーテキスト - 入力フィールドのヒント
  Color get placeholder => mediumEmphasis;
  
  /// キャプションテキスト - 画像キャプション、脚注
  Color get caption => mediumEmphasis;
  
  /// ラベルテキスト - フォームラベル、説明
  Color get label => highEmphasis;
  
  /// 逆転テキスト - 濃い背景上のテキスト
  Color get inverse => _colorScheme.onInverseSurface;
  
  /// サーフェス上のテキスト（コンテナ内）
  Color get onContainer => _colorScheme.onSurfaceVariant;
}

/// Material Design 3のセマンティックテキストスタイル拡張
extension SemanticTextStyles on TextTheme {
  /// 主見出し - 最も重要な見出し
  TextStyle? get primaryHeadline => displayLarge?.copyWith(
    fontWeight: FontWeight.bold,
  );
  
  /// セカンダリ見出し - 副見出し
  TextStyle? get secondaryHeadline => headlineMedium?.copyWith(
    fontWeight: FontWeight.w600,
  );
  
  /// セクション見出し - セクションタイトル
  TextStyle? get sectionTitle => titleLarge?.copyWith(
    fontWeight: FontWeight.w600,
  );
  
  /// カードタイトル - カード内の見出し
  TextStyle? get cardTitle => titleMedium?.copyWith(
    fontWeight: FontWeight.w500,
  );
  
  /// 本文テキスト - 標準の本文
  TextStyle? get bodyText => bodyLarge;
  
  /// 説明テキスト - 補助的な説明
  TextStyle? get description => bodyMedium;
  
  /// キャプション - 画像説明、脚注
  TextStyle? get captionText => bodySmall;
  
  /// ラベル - フォームラベル
  TextStyle? get labelText => labelLarge?.copyWith(
    fontWeight: FontWeight.w500,
  );
  
  /// ボタンラベル - ボタンテキスト
  TextStyle? get buttonLabel => labelLarge?.copyWith(
    fontWeight: FontWeight.w600,
  );
  
  /// リンクテキスト - クリック可能なテキスト
  TextStyle? get linkText => bodyMedium?.copyWith(
    decoration: TextDecoration.underline,
  );
}

/// セマンティックテキストウィジェット
/// 
/// 色と意味を結びつけた体系的なテキストコンポーネント
class SemanticText extends StatelessWidget {
  final String text;
  final SemanticTextType type;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  
  const SemanticText(
    this.text, {
    super.key,
    required this.type,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = SemanticTextColors(colorScheme);
    
    final (color, defaultStyle) = switch (type) {
      SemanticTextType.primaryHeadline => (
        semanticColors.highEmphasis,
        textTheme.primaryHeadline,
      ),
      SemanticTextType.secondaryHeadline => (
        semanticColors.highEmphasis,
        textTheme.secondaryHeadline,
      ),
      SemanticTextType.sectionTitle => (
        semanticColors.highEmphasis,
        textTheme.sectionTitle,
      ),
      SemanticTextType.cardTitle => (
        semanticColors.highEmphasis,
        textTheme.cardTitle,
      ),
      SemanticTextType.body => (
        semanticColors.highEmphasis,
        textTheme.bodyText,
      ),
      SemanticTextType.description => (
        semanticColors.mediumEmphasis,
        textTheme.description,
      ),
      SemanticTextType.caption => (
        semanticColors.mediumEmphasis,
        textTheme.captionText,
      ),
      SemanticTextType.label => (
        semanticColors.label,
        textTheme.labelText,
      ),
      SemanticTextType.button => (
        semanticColors.primaryAction,
        textTheme.buttonLabel,
      ),
      SemanticTextType.link => (
        semanticColors.primaryAction,
        textTheme.linkText,
      ),
      SemanticTextType.error => (
        semanticColors.error,
        textTheme.bodyText,
      ),
      SemanticTextType.success => (
        semanticColors.success,
        textTheme.bodyText,
      ),
      SemanticTextType.warning => (
        semanticColors.warning,
        textTheme.bodyText,
      ),
      SemanticTextType.disabled => (
        semanticColors.disabled,
        textTheme.bodyText,
      ),
      SemanticTextType.placeholder => (
        semanticColors.placeholder,
        textTheme.description,
      ),
    };
    
    return Text(
      text,
      style: defaultStyle?.copyWith(color: color).merge(style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// セマンティックテキストタイプ
enum SemanticTextType {
  primaryHeadline,
  secondaryHeadline,
  sectionTitle,
  cardTitle,
  body,
  description,
  caption,
  label,
  button,
  link,
  error,
  success,
  warning,
  disabled,
  placeholder,
}

/// ヘルパーウィジェット
class PrimaryHeadline extends StatelessWidget {
  final String text;
  final TextStyle? style;
  
  const PrimaryHeadline(this.text, {super.key, this.style});
  
  @override
  Widget build(BuildContext context) {
    return SemanticText(
      text,
      type: SemanticTextType.primaryHeadline,
      style: style,
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  
  const DescriptionText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
  });
  
  @override
  Widget build(BuildContext context) {
    return SemanticText(
      text,
      type: SemanticTextType.description,
      style: style,
      maxLines: maxLines,
    );
  }
}

class ErrorText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  
  const ErrorText(this.text, {super.key, this.style});
  
  @override
  Widget build(BuildContext context) {
    return SemanticText(
      text,
      type: SemanticTextType.error,
      style: style,
    );
  }
}

class SuccessText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  
  const SuccessText(this.text, {super.key, this.style});
  
  @override
  Widget build(BuildContext context) {
    return SemanticText(
      text,
      type: SemanticTextType.success,
      style: style,
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;
  
  const LinkText(
    this.text, {
    super.key,
    this.onTap,
    this.style,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SemanticText(
        text,
        type: SemanticTextType.link,
        style: style,
      ),
    );
  }
}