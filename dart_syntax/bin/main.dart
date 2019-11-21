
//The special, required, top-level function where app execution starts.
main(List<String> arguments) {
  dynamic x = 'hal';
  x = 123;
  print(x);
  Object y = 'hal';
  y = 123;
  var a = 'hal';
//  a = 123;
  print(a);

//  y.getit();
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




