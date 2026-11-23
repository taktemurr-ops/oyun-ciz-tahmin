import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ciz_tahmin/oyun_ciz_tahmin.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(cizTahminConfig.title.length, 33);
    expect(cizTahminConfig.tagline.length, 33);
    for (final s in cizTahminConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(cizTahminConfig.gameId, cizTahminId);
    expect(cizTahminRules.gameId, cizTahminId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(cizTahminRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: cizTahminId, optionalMechanics: cizTahminRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(cizTahminRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
