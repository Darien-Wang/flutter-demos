
//The special, required, top-level function where app execution starts.
main(List<String> arguments) {
}

int exceptionDemo() {
  var a = 1;
  try {
    throw Exception();
  } catch (e) {
    a = 2;
    return a;
  } finally {
    a = 3;
    print('a = $a');
//    return a;
  }
}



