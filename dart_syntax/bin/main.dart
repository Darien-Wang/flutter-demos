//The special, required, top-level function where app execution starts.
import 'dart:async';

main(List<String> arguments) {
  for (var value in [1, 2, 3, 4, 5, 6]) {
    if (value < 3) {
      print(value);
    } else {
      return;
    }
  }
}
