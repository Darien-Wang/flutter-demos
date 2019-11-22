//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  print(GenericDemo<int>().printGenericT(11111));
}

class GenericDemo<T> {
  T printGenericT(T t) {
    print(t.toString());
    print(t.hashCode);
    print((t as String).length);
    return t;
  }
}

