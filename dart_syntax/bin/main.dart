//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  print(B().name);
}

class A {
  A() {
    print('A的构造函数');
  }
}

class B extends A {
  final String name;

  B() : name = "李明" {
    print('B的构造函数');
  }
}
