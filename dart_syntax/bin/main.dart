main() async {
  try {
    await walk();
  } catch (e) {
    print(e);
  }
}

Future<void> walk() async {
  print('walk walk');
  throw "throw in walk";
}
