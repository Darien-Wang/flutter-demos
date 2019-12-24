//定义named parm function
void walk(
  String name, {
  String gender,
  int step,
}) {
  print('$name,性别$gender走了$step步');
}

//定义positional parm function
void eat(String name, [int rice, int noddles]) {
  print('$name吃了米饭$rice碗，面条$noddles碗');
}

void main({List args}) async {
  walk("LiMing", step: 9999); //这里好处是要求传递参数的名字,并且不必依赖顺序，这个是flutter大量使用的语法
  eat("Zhangsan", 3); //positional param必须按照顺序传递参数
  print(sleep());
  print('');
}

Future<int> sleep() async {
  return await sleep();
}


