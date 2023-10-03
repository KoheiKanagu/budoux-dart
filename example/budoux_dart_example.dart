import 'dart:io';

import 'package:budoux_dart/src/budoux_dart.dart';

void main() {
  final budouX = BudouX(
    File('lib/models/ja.json').readAsStringSync(),
  );

  final results = budouX.parse(
    '今日は良い天気ですね。',
  );

  for (final e in results) {
    print(e);
  }
}
