# BudouX-Dart

A Dart implementation of [BudouX](https://github.com/google/budoux)

## Flutter のサンプル

```yaml
# pubspec.yaml
dependencies:
  budoux_dart:
    git:
      url: https://github.com/KoheiKanagu/budoux-dart.git
      ref: 1.0.0

flutter:
  assets:
    - packages/budoux_dart/models/ja.json
```

```dart
  final budouX = BudouX(
    await rootBundle.loadString('packages/budoux_dart/models/ja.json'),
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
