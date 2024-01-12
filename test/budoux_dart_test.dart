import 'dart:io';

import 'package:budoux_dart/budoux.dart';
import 'package:test/test.dart';

void main() {
  test('Japanese', () {
    final budouX = BudouX(
      File('lib/models/ja.json').readAsStringSync(),
    );

    final actual = budouX.parse(
      '今日は良い天気ですね。',
    );

    expect(
      actual,
      [
        '今日は',
        '良い',
        '天気ですね。',
      ],
    );
  });

  test('Simplified Chinese', () {
    final budouX = BudouX(
      File('lib/models/zh-hans.json').readAsStringSync(),
    );

    final actual = budouX.parse(
      '是今天的天气。',
    );

    expect(
      actual,
      [
        '是',
        '今天',
        '的',
        '天气。',
      ],
    );
  });

  test('Traditional Chinese', () {
    final budouX = BudouX(
      File('lib/models/zh-hant.json').readAsStringSync(),
    );

    final actual = budouX.parse(
      '是今天的天氣。',
    );

    expect(
      actual,
      ['是', '今天', '的', '天氣。'],
    );
  });

  test('Thai', () {
    final budouX = BudouX(
      File('lib/models/th.json').readAsStringSync(),
    );

    final actual = budouX.parse(
      'วันนี้อากาศดี',
    );

    expect(
      actual,
      [
        'วัน',
        'นี้',
        'อากาศ',
        'ดี',
      ],
    );
  });
}
