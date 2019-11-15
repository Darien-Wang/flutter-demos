main(List<String> arguments) {
  var a1 = A();
  var a2 = A();

  Set set = <A>{};
  set.add(a1);
  set.add(a2);
  print(set);
}

class A {
  @override
  bool operator ==(other) => false;

//
  @override
  int get hashCode => 1;
}
