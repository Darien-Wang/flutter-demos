//说明一个普通的函数的闭包能力
void main() {
  var a = Widget("aaa");
  var p = Person();
  p.voidCallback = a.printName;

  p.voidCallback();

  a.name = "bbb";
  p.voidCallback();
}

typedef VoidCallback = void Function();

class Widget {
  String name;

  Widget(this.name);

  void printName() {
    print(name);
  }
}

class Person {
  VoidCallback voidCallback;
}
