//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  getNumbers().forEach((element) {
    print(element);
  });
}

Stream<int> getNumbers() async* {
  yield 0;
  for (int i = 0; i < 10; i++) {
    yield i;
  }
}

Stream<int> skip1
(
)




