
//The special, required, top-level function where app execution starts.
main(List<String> arguments) {
  var a = 89;
  var b = 10;
  print(a ~/ b);
}

abstract class Animal {
  void chase(covariant Animal x);
}

abstract class Mouse extends Animal {}

abstract class Cat extends Animal {
  void chase(Mouse x);
}

class A {
  @override
  bool operator ==(other) => true;

//
  @override
  int get hashCode => 1;
}

void walk() {
  return null;
}




