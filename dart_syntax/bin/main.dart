//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  FakeCat().sleep();
}

class Cat {
  String sleep() {
    return "hu~hu~";
  }
}

class Fake {
  @override
  noSuchMethod(Invocation invocation) {
    throw "no!!";
  }
}

class FakeCat extends Fake implements Cat {}

