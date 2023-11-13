# BudouX-Dart

[![pub package](https://img.shields.io/pub/v/budoux_dart.svg?label=budoux_dart&color=blue)](https://pub.dartlang.org/packages/budoux_dart)

[BudouX](https://github.com/google/budoux)の Dart 実装です。

[Release v0\.5\.2 · google/budoux](https://github.com/google/budoux/releases/tag/v0.5.2)の[Java の実装](https://github.com/google/budoux/blob/v0.5.2/java/src/main/java/com/google/budoux/Parser.java)を参考にしています。

## Flutter のサンプル

```yaml
# pubspec.yaml
flutter:
  assets:
    - packages/budoux_dart/models/ja.json
    # or ja_knbc.json
```

```dart
  final budouX = BudouX(
    await rootBundle.loadString('packages/budoux_dart/models/ja.json'),
    // or ja_knbc.json
  );
```

```dart
return Scaffold(
  body: DefaultTextStyle(
    style: const TextStyle(
      fontSize: 48,
      color: Colors.black,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('今日はいい天気ですね。'),
        const Divider(),
        Wrap(
          children: budouX
              .parse(
                '今日はいい天気ですね。',
              )
              .map(Text.new)
              .toList(),
        ),
      ],
    ),
  ),
);
```

<img width="400" alt="スクリーンショット 2023-09-25 17 59 52" src="https://github.com/KoheiKanagu/budoux-dart/assets/6175794/3497a032-b95e-43e6-9d06-3bb9befa376e">
