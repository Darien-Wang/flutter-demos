import 'dart:math';

class A {
  int calculate(B b) {
    int randomNum = b.getRandomNum();
    return randomNum * 2;
  }
}

class B {
  int getRandomNum() {
    return Random().nextInt(100);
  }
}
