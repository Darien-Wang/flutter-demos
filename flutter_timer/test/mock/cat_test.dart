import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/mock/cat.dart';
import 'package:mockito/mockito.dart';

// Mock class
class MockCat extends Mock implements Cat {}

main() {
  Cat cat;

  setUp(() {
    // Create mock object.
    cat = MockCat();
  });

  group("cat test", () {
    test("test cat sleep", () {
      expect(cat.sleep(), null);
      when(cat.sleep()).thenReturn("我在睡觉");
      expect(cat.sleep(), "我在睡觉"); //这个会报错
    });

    test("test cat walk", () {
      expect(cat.walk(), null);
    });
  });
}
