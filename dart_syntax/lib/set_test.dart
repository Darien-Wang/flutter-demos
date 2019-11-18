// ignore: slash_for_doc_comments
/**
 * Set Test 是为了证明，Set中，重复元素的判定是基于Hashcode和==操作符的，
 * 如果二者都相等，则Set判定为重复
 */
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
  bool operator ==(other) => true;

//
  @override
  int get hashCode => 1;
}
