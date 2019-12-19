void main() {
  print(<int>[] is List<int>);
  print(<int>[] is List<String>);
  print(<int>[] is List<dynamic>);
  print(<int>[] is List<Object>);
  print(<int>[] is List<num>);

  print(1 is dynamic);
  print(1 is Object);
  print(1 is Null);
}

class AFather {
  String name;

  AFather(this.name);
}

class A extends AFather {
  factory A.name() {
    print('');
    return null;
  }
}
