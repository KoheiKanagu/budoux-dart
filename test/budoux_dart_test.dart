import 'package:budoux_dart/budoux.dart';
import 'package:test/test.dart';

void main() {
  test('example', () {
    final budouX = BudouX('assets/models/ja.json');

    final actual = budouX.parse(
      '今日は良い天気ですね。',
    );

    expect(actual, [
      '今日は',
      '良い',
      '天気ですね。',
    ]);
  });
}
