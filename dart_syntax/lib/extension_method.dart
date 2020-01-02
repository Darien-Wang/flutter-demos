//介绍拓展函数
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
// ···
}

extension FancyList<T> on List<T> {
  List<T> get evenElements {
    return <T>[for (int i = 0; i < this.length; i += 2) this[i]];
  }
}

extension ShiftString on String {
  String operator <<(int shift) {
    return this.substring(shift, this.length) + this.substring(0, shift);
  }
}

void main() {
  print('42'.parseInt());
  var list = [1,2,3];
  list.evenElements.forEach((value) {
    print(value);
  });

  print("hello" << 2);
}
