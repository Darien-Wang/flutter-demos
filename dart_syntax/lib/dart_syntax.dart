int calculate() {
  return 6 * 6;
}

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

///Variables:"https://dart.dev/guides/language/language-tour#variables"
/// [TheVariable] shows difference between const reference & const value

const topLevelConstString = 'Bob'; //可以定义一个Top Level的const

class TheVariable {
  var name = 'Bob';
  static const staticConstStringReference =
      "Bob"; //如果定义一个class level的const，必须使用static修饰。事实上因为const是编译期常量，必须使用static修饰。
  var constValue =
  const [
  ]; //this show define of const value,not const reference,这种情况，constValue可以重新指向新的值。
  var it = 1;
}

///Built-in types
///The Dart language has special support for the following types:
///
///numbers,strings,booleans,lists (also known as arrays),sets,maps,runes (for expressing Unicode characters in a string),symbols
///You can initialize an object of any of these special types using a literal. For example, 'this is a string' is a string literal, and true is a boolean literal.
///详细信息："https://dart.dev/guides/language/language-tour#built-in-types
///这块可以关注 spread operator（...）和null-aware spread operator (...?)，字符串模版，“raw” string， multi-line string，const list，const set，const map


///函数Functions:"https://dart.dev/guides/language/language-tour#functions"
/**
 * 这块的重点是：函数在Dart中同样是对象，类型是Function，所以可以像操作class一样使用Function。
 * returnType functionName(param) {
 *    expressions optional;
 *    return expr;
 * }
 *
 * 函数支持重写，不支持重载，也即是在Dart中同一个类内不允许有同名的函数（因为可选参数的存在，其实重载已经没有意义）。
 *
 * 对于单行函数可以使用=>来直接返回bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
 *
 * 对于函数，有两种参数： required and optional.
 * 对于optional参数，包含两种： named or positional。两种不能共存
 * named params包裹在大括号内声明：void enableFlags({bool bold, bool hidden}) {...}，可以是使用@required来要求必须传递的named param
 * positional params包裹在中括号声明：String say(String from, String msg, [String device]){}
 * 对于可选参数，可以使用=来定义默认值，否则默认值是null，
 */

///main函数："https://dart.dev/guides/language/language-tour#the-main-function"
///Every app must have a top-level main() function, which serves as the entrypoint to the app. The main() function returns void and has an optional List<String> parameter for arguments.
///main函数在形式上，并不要求一定提供可选的参数

///Lexical scope（词法范围）
/**
 * 在Dart中，这取决于layout of the code。
 */

///Lexical closures（词法闭包）
/**
 *A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.
 */

/**
 * top-level和class函数永远是相等的，但是Instance函数的相等必须是同一个instance才ok
 * All functions return a value. If no return value is specified, the statement return null; is implicitly appended to the function body.
 */

///Operators操作符
/**
 * 操作符有很多种，包含单目的，双目的等等，一部分是可以重写的："https://dart.dev/guides/language/language-tour#overridable-operators"
 * ==操作符定义在Object中，默认实现是测定两个对象是不是同一个，当然这个操作符可以被重写，同时应该重写hashcode method.
 * 在Dart中，仍然存在短路与和短路或的操作，我们建议使用短路操作符。而&和|操作符应该值用于Bit操作
 * [Object]顺便提一下：这个类包含一个空的构造函数，==函数，hashcode属性，toString函数，noSuchMethod函数，和runtimeType属性
 * 因为null的特殊性，说明一下。null在Dart中的类型是Null（重写了toString方法），null在运行时为单例的，所以相关的==操作返回true
 * 对于声明了类型的null值，比如：String name = null,在运行时只会获取Null类型的行为，所以在null值上的操作后果，可以通过Null类型来判定
 * 比如：null值上面调用method或者properties，不会有空指针异常而是noSuchMethod错误(属性调用的默认是get或者set操作)
 */

///Control flow statements，这一部分没有特别的地方
/**
 * if and else
    for loops
    while and do-while loops
    break and continue
    switch and case
    assert
 */

///Exceptions
/**
 * 在Dart中，没有Checked Exception，也就是系统不强制你捕获异常
 * 没有被捕获的异常会引起isolate挂起，也就是当前isolate被终止了
 * Dart包含Exception和Error，二者都继承于Object（而不是类似java属于Throwable子类）（，前者用于向用户提供一个failure的信息，后者通常表示一个program failure，用户不应该试图捕获Error而是解决它
 * 对于Dart而言，throw可以是任何none-null的类型，而不局限于Exception。
 *
 * catch一个异常，用于阻止异常的传播并处理他，除非rethrow它，语法类似于
 * try{}
 * on XXXException catch{e,s}
 *
 * 其中：on XXXException是可选的，如果参数s也是可选的，代表StackTrace,如果使用on不使用catch，那么参数都是可选的
 *
 * finally用于无论异常是否发生，都要执行的代码块，类似于java，在finally中使用return语句可以刷新函数的返回（仅用于只是探讨，不建议finally做return）
 */

///Class
/// Dart is an object-oriented language with classes and mixin-based inheritance,Every object is an instance of a class, and all classes descend from Object. Mixin-based inheritance means that although every class (except for Object) has exactly one superclass, a class body can be reused in multiple class hierarchies.
/// 注意，针对对象的属性访问，建议使用?.操作符，可以避免null的问题
///
/// 构造函数：
/// 包含默认的构造函数（使用类名，空参），构造函数同样可以包含可选参数，也就是包含named和positional参数。
/// 如果定义了构造函数，即便是一个NamedConstructor，则不再提供默认的空参构造函数。
/// 可以声明const构造函数，这要求类的instance variable都是final的,
/// 只有声明了const构造函数的情况下，才可以在调用的时候声明const reference或者const value，这样在做==比对的时候返回true，如果只是普通调用，则在运行时生成普通的instance对象。
/// 声明了const构造函数的，必须在NamedConstructor中给final字段赋值
/// 默认而言，构造函数调用父类unnamed,no-argument构造函数（如果父类没有这个构造函数，子类必须手动的指定调用父类特定的构造函数），如果包含 initializer list则il最先执行，顺序是：
/// 1 initializer list(这个可以用于NamedConstructor或者常规的,在构造函数的参数之后，用：分隔，赋值语句用逗号分隔，位于function body的大括号前面，如果没有function body使用分号结束)
/// 2 superclass’s no-arg constructor
/// 3 main class’s no-arg constructor
///
///
/// 属性：
/// 所有的field都包含隐式的getter，如果可以的也包含setter，我们可以使用关键词set和get来定义property，语法是：
/// returnType get propertyName {function body}
/// set propertyName(oneParam){function body}这里强调，set要求只能有一个参数
///
/// 抽象函数：
/// 抽象的函数必须存在于抽象类
/// getter和setter也可以是抽象的，
///
/// 隐式接口：
/// 所有的类都是一个接口，可以被implement，这种情况下，类定义的所有instance method都要求重写(包含只有getter或者setter的property)
///
/// Extend：Dart支持单继承结构，在重写的情况下，如果要narrow函数的参数或者instance variable，可以使用关键词covariant表示协变
///
///
///

abstract class ClassDemo {
  final String name;
  static int age;

  //配置属性
  String get nameAndAge => "$name $age";

  set nameAndAge(String a) {
    nameAndAge = a;
  }

  //抽象的getter
  String get length;

  //配置抽象函数
  void walk();

  //抽象类可以配置NamedConstructor，但这并不能被调用，因为抽象类不能被初始化
  ClassDemo.nullInstance(String name) :name = name;

  //抽象类可以配置常规的Constructor，但这并不能被调用，因为抽象类不能被初始化
  const ClassDemo(this.name);
}

class ClassDemoImpl implements ClassDemo {
  @override
  String nameAndAge;

  @override
  // TODO: implement length
  String get length => null;

  @override
  // TODO: implement name
  String get name => null;

  @override
  void walk() {
    // TODO: implement walk
  }
}































































