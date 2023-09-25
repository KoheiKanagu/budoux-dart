import 'dart:convert';
import 'dart:io';

class BudouX {
  BudouX(String modelFilePath) {
    _model = json.decode(
      File(modelFilePath).readAsStringSync(),
    ) as Map<String, dynamic>;

    totalScore = _model.values
        .map(
          (e) => (e as Map<String, dynamic>).values.map(
                (e) => e as int,
              ),
        )
        .map(
          (e) => e.fold(
            0,
            (a, b) => a + b,
          ),
        )
        .fold(
          0,
          (a, b) => a + b,
        );
  }

  late final Map<String, dynamic> _model;

  late final int totalScore;

  int getScore(String featureKey, String sequence) {
    // ignore: avoid_dynamic_calls
    return int.tryParse('${_model[featureKey][sequence]}') ?? 0;
  }

  List<String> parse(String sentence) {
    if (sentence.isEmpty) {
      return [];
    }

    final result = <String>[sentence[0]];

    for (var i = 1; i < sentence.length; i++) {
      var score = -totalScore;
      if (i - 2 > 0) {
        score += 2 * getScore('UW1', sentence.substring(i - 3, i - 2));
      }
      if (i - 1 > 0) {
        score += 2 * getScore('UW2', sentence.substring(i - 2, i - 1));
      }
      score += 2 * getScore('UW3', sentence.substring(i - 1, i));
      score += 2 * getScore('UW4', sentence.substring(i, i + 1));
      if (i + 1 < sentence.length) {
        score += 2 * getScore('UW5', sentence.substring(i + 1, i + 2));
      }
      if (i + 2 < sentence.length) {
        score += 2 * getScore('UW6', sentence.substring(i + 2, i + 3));
      }
      if (i > 1) {
        score += 2 * getScore('BW1', sentence.substring(i - 2, i));
      }
      score += 2 * getScore('BW2', sentence.substring(i - 1, i + 1));
      if (i + 1 < sentence.length) {
        score += 2 * getScore('BW3', sentence.substring(i, i + 2));
      }
      if (i - 2 > 0) {
        score += 2 * getScore('TW1', sentence.substring(i - 3, i));
      }
      if (i - 1 > 0) {
        score += 2 * getScore('TW2', sentence.substring(i - 2, i + 1));
      }
      if (i + 1 < sentence.length) {
        score += 2 * getScore('TW3', sentence.substring(i - 1, i + 2));
      }
      if (i + 2 < sentence.length) {
        score += 2 * getScore('TW4', sentence.substring(i, i + 3));
      }
      if (score > 0) {
        result.add('');
      }
      result[result.length - 1] += sentence[i];
    }
    return result;
  }
}
