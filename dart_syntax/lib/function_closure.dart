//闭包的常用场景，还有flutter控件的点击事件。比如以下模仿widget的写法
typedef VoidCallback = void Function();

class Widget {
  VoidCallback onTap;

  Widget({this.onTap});
}

//展示函数传参的闭包
Widget getWidget(String name) {
  return Widget(onTap: () {
    print('$name被点击了');
  });
}

//在这个例子里面，匿名函数(x) => ticks - x - 1就闭包了ticks
Stream<int> tick({int ticks}) {
  return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
      .take(ticks);
}

void main() {
  //这里展示对于一个普通的外层可访问变量的闭包
  var name = "Liming";
  //模拟flutterwidget点击的闭包,这里是对外层scope的闭包
  var widgetByNew = Widget(onTap: () {
    print('$name被点击了'); //这里触发对name的闭包，当然业务里面可能是更复杂的业务数据，比如列表对应的cell数据
  });
  widgetByNew.onTap();
  name = "ZhangSan"; //我们修改被闭包的引用指向
  widgetByNew.onTap(); //这里看出引用发生了变化对结果有影响，所以我认为函数的闭包，可以类比对象持有某个引用
  //这里引申一个问题，就是如果希望闭包的对象不受影响，我们应该让闭包使用const或者final的引用。

  //这里展示对函数的参数的闭包，似乎不同于常规的对于外层闭包
  print('===============');
  var theName = "李四";
  var widgetByFunction = getWidget(theName);
  widgetByFunction.onTap();
  theName = "张三";
  widgetByFunction.onTap();
  print('=========');

  //这里是倒计时的一种写法
  tick(ticks: 5).listen((int number) {
    print("当前number = $number");
  });
}
