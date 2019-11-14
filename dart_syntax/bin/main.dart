import 'package:dart_syntax/dart_syntax.dart';

//The special, required, top-level function where app execution starts.
main(List<String> arguments) {
  //hello word with import of package & string template & single-line comments

  print('Hello world: ${calculate()}!');
  /*
  multi-line comments,
   */

  ///this is single line documentation comments
  /**
   * this is multi-line documentation comments
   */

  /**
   * 重要的概念：
   * 1  Dart中皆为对象，所有的对象都是class的实例，所有对象都直接或者间接继承于Object。即便是numbers，functions，null也是个对象
   * 2  Dart是强类型语言，但是类型声明不是强制的，可以通过类型推导获得，如果希望明确没有类型，可以使用[dynamic],注意：如果仅仅是想表达一个可以使用任何objects，应该使用Object。dynamic的使用："https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed"
   * 3  Dart支持泛型，支持泛型类和泛型函数。Dart的泛型是存在在运行时的，这意味这我们可以判定一个object is List<int>是Ok的。
   * 4  Dart支持top-level functions（比如main函数），绑定class或者object的functions（也就是static或者instance methods），也可以在函数内部创建函数（也就是nested或者local functions）
   * 5  Dart支持top-level variables，同时支持绑定class或者object的variables（也就是static或者instance variables），instance variables有时候又被称为字段或者属性
   * 6  Dart的访问控制不同于java，Dart可见行控制仅仅是library级别，如果一个对象是用_开头来命名的，那么就是library可见，否则就是到处可见的。
   * 7  标志符使用字母或者下划线（_）开头，后面可以是字母或者数字的任意组合
   * 9  Dart拥有expressions（which have runtime values）和statements（which don`t），简单理解，expression是拥有返回值的(包含void），后者比如if else语句，不具备返回值的能力。statement通常包含一个或者多个expression，but an expression can’t directly contain a statement.
   * 10 Dart tools可以报告两种问题：warnings和errors，前者只是警告代码可能不工作，但并不会影响执行。errors可以是编译期或者运行期。编译期错误会组织代码执行，运行期错误会产生exception
   */

  /**
   * Dart的关键词："https://dart.dev/guides/language/language-tour#keywords"
   */

  ///Variables
  var name = 'Bob'; //variables存储一个regerences，这里使用var表示类型推导，变量名字是name，赋值字符串：Bob
  String name1 = 'Bob'; //这里使用String，强制指定了name1的类型
  ///没有初始化的variables默认拥有初始值null，即便是number类型的默认值也是null
  ///对于Variable可以声明为final后者const以替代var，final变量只可以被赋值一次（在声明的时候赋值，或者构造函数赋值），const变量是


}

