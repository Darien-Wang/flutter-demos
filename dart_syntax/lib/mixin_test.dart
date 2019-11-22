//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  var xx = XX();
  xx.walk();
  print(xx is A);
  print(xx is B);
  print(xx is C);
  print(xx is D);
}

class A {
  void walk() {
    print('A walk');
  }
}

mixin B {
  void walk() {
    print('B walk');
  }
}

class C {
  void walk() {
    print('C walk');
  }
}

//嘿嘿，添加了另外一个
mixin D on A {
  void walk() {
    print('D walk');
  }
}

//extends with implements是顺序是固定的
//
class XX extends A with B, D implements C {
  @override
  void walk() {
    super.walk();
    print('XX walk');
  }
}
