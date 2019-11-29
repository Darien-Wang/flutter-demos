import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/counter.dart';

void main() {
  // 单一的测试
  test("测试 value 递增", () {
    final counter = Counter();
    counter.increment();

    // 验证 counter.value 的是是否为 1
    expect(counter.value, 1);
  });

  // 使用 group 合并多个测试。用来测试多个有关联的测试
  group("Counter", () {
    test("value should start at 0", () {
      expect(Counter().value, 0);
    });

    test("value should be increment", () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test("value should be decremented", () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
