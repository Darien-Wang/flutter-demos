///this document is a supplement for official document:"https://dart.dev/guides/language/language-tour"
///this document focus on what is used frequently but the official document didn't explain in detail.

//this is a single-line comment
/*
this is a multi-line comment,
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
 * Dart的关键词："https://dart.dev/guides/language/language-tour#keywords",这些关键词不要用于identifier。
 *
    abstract :用于声明抽象类
    dynamic:用于申明不要类型的，这个和Object的用法区别不慎明了，目前官方的解释也比较笼统："https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed"
    implements:实现接口，由于Dart中没有专门的接口，每一个类都是一个隐式的接口，implements其实实现的是类定义的协议
    show:用于库的部分倒入
    hide：用于库的部分隐藏
    as:类型转换,错误的类型转换会抛出异常，对于null值的转换不会有任何异常
    if else 条件语句
    import 导入包
    static 声明class method 或者 class variable
    assert：用于develop期间，做断言测试，正式运行的包不会执行
    enum 声明枚举
    in 用于for-in循环语法
    super：用于召唤父类
    async：用于声明异步函数
    export：用于声明对外暴露的类
    interface:这个关键词应该是被移除了，官方的点击链接也是指向stack overflow的讨论，不建议作为标志符
    switch case default：用于分支的语法，default必须防止在最后一项。
    await：用于async包围的function body
    extends：用于继承一个类
    is：用于判断是否是否个类型，对于null值的判断只会判定为Null
    sync：用于Generator语法，"https://dart.dev/guides/language/language-tour#generators"
    break：用于switch case语法用于终止向下一个case的执行，用于循环，终止当前循环
    continue:用于跳过循环的某一次，继续执行下一轮循环
    external：用于声明某个实现是平台相关的，比如[Object]的==，hashcode等方法都标注为这个。"https://stackoverflow.com/questions/24929659/what-does-external-mean-in-dart"
    library：用于声明一个library的名字，通常在一个包的lib下面的直接层级的dart文件内，定义：library name
    this：用于指代当前类的对象本身
    factory：用于修饰构造函数，声明为一个factory constructor，和普通构造函数的区别是，这里可以使用return语句。
    mixin:用于声明一个只能用于with语法的类，提供了介于extends和implements的混合能力
    throw：用于跑出一个除了null之外的对象，通常用于抛出Exception
    try on catch finally:try语法用于包裹执行体，on用于检测特定的exception，catch语法用于全部的exception，finally用于无论是否异常一定执行的语句块
    false true：用于声明bool值
    new:用在构造函数之前，目前dart这个关键词是可选的
    class：用于声明一个类
    final：用于声明一个只能被赋值一次的值
    null：声明一个null值，所有对象默认值就是null
    const：声明一个编译器常量，用于dart的基本数据类型和拥有const构造函数的类
    typedef ：也被称为：function-type alias,用于给函数声明一个名字，typedef只针对函数，并且包含了函数的返回值，传参类型等签名信息。是比Function更加严格的约束
    for:用于for循环，包含常规的for循环和for-in循环
    operator:用于操作符重写，语法是：returnType operator overridableOperator(param) {function body}
    var:用于声明一个引用，但是不指明引用的类型，而是使用类型推导
    covariant：用于申明重写函数的参数的协变，也就是在子类中函数参数可以使用原来参数的子类行
    Function ：用于声明函数类型
    part：用于声明一个dart文件包含另外一个dart文件，被包含的dart文件使用part of来声明自己是某个dart文件的一部分，二者是配套使用的
    void：声明不用返回特定类型的函数，默认的返回就是void
    get set:用于申明getter和setter函数，语法是：returnType get propertyName(){function body}  set propertyName(oneParam){function body}
    rethrow:用于catch语法中重新抛出object（不能是null）
    while do:用于while或者do-while循环
    deferred：用于延迟加载，用于flutter_web项目，语法是：import "package:xxx" deferred as yyy,其中yyy作为库引用的别称
    return：用于函数的返回
    with：和mixin组合，是dart中介于extends和implements的一种类组合方案
    set：声明Set数据结构，Set内元素不允许重复,判断的依据是hashcode和==操作符，当其中一个不同的时候就会认为是不同的。
    yield：用于Generator语法：用来发送value。在synchronous generator返回类型是Iterable<T>,在asynchronous generator中返回Stream<T>
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
 * 对于单行函数可以使用=>来直接返回,比如：bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
 *
 * 对于函数，有两种参数： required and optional.
 * 对于optional参数，包含两种： named or positional。两种不能共存
 * named params包裹在大括号内声明：void enableFlags({bool bold, bool hidden}) {...}，可以是使用@required来要求必须传递的named param
 * positional params包裹在中括号声明：String say(String from, String msg, [String device]){}
 * 对于可选参数，可以使用=来定义默认值，否则默认值是null，
 *
 * Instance methods，属于绑定对象的函数，可以通过this访问，
 *
 * getters和setter是特殊的函数，用于提供read和write的控制，每个instance field包含隐式的getter and|or setter，
 *
 * 所有函数都有返回值，如果不指定，return null被隐式的添加到function body。
 */

///main函数："https://dart.dev/guides/language/language-tour#the-main-function"
///Every app must have a top-level main() function, which serves as the entrypoint to the app. The main() function returns void and has an optional List<String> parameter for arguments.
///main函数在形式上，并不要求一定提供可选的参数

///Lexical scope（词法范围）
/**
 * 在Dart中，这取决于layout of the code。
 */

///Lexical closures（词法闭包):"https://dart.dev/guides/language/language-tour#lexical-closures"
/**
 *A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.
 */

/**
 * top-level和class函数永远是相等的，但是Instance函数的相等必须是同一个instance才ok
 * All functions return a value. If no return value is specified, the statement return null; is implicitly appended to the function body.
 */

///Operators操作符
// ignore: slash_for_doc_comments
/**
 * 操作符有很多种，包含单目的，双目的等等，一部分是可以重写的："https://dart.dev/guides/language/language-tour#overridable-operators"
 * ==操作符定义在Object中，默认实现是测定两个对象是不是同一个，当然这个操作符可以被重写，同时应该重写hashcode method.
 * 在Dart中，仍然存在短路与和短路或的操作，我们建议使用短路操作符。而&和|操作符应该值用于Bit操作
 * [Object]顺便提一下：这个类包含一个空的构造函数，==函数，hashcode属性，toString函数，noSuchMethod函数，和runtimeType属性
 * 因为null的特殊性，说明一下。null在Dart中的类型是Null（重写了toString方法），null在运行时为单例的，所以相关的==操作返回true
 * 对于声明了类型的null值，比如：String name = null,在运行时只会获取Null类型的行为，所以在null值上的操作后果，可以通过Null类型来判定
 * 比如：null值上面调用method或者properties，不会有空指针异常而是noSuchMethod错误(属性调用的默认是get或者set操作)
 *
 * 介绍几个常用的有用的操作符：
 * a ??= b 用于a为null的情况下赋值,
 * expr1 ?? expr2如果expr1不是null，返回expr1，否则返回expr2。这个在if语句中用于防止被判定的bool为null很好用
 * .. 级联操作符，allow you to make a sequence of operations on the same object
 * ?.Conditional member access。当被调用的是null的时候，不会触发noSuchMethod异常，而是直接返回null，和上面两个操作符可以配合使用
 *
 *
 */
class OperatorVectorDemo {
  double x, y;

  OperatorVectorDemo(this.x, this.y);

  OperatorVectorDemo operator +(OperatorVectorDemo other) {
    return OperatorVectorDemo(this.x + other.x, this.y + other.y);
  }
}

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
// ignore: slash_for_doc_comments
/**
 * Dart is an object-oriented language with classes and mixin-based inheritance,Every object is an instance of a class, and all classes descend from Object. Mixin-based inheritance means that although every class (except for Object) has exactly one superclass, a class body can be reused in multiple class hierarchies.
 * 注意，针对对象的属性访问，建议使用?.操作符，可以避免null的问题
 *
 * 构造函数：
 * 包含默认的构造函数（使用类名，空参），构造函数同样可以包含可选参数，也就是包含named和positional参数。
 * 如果定义了构造函数，即便是一个NamedConstructor，则不再提供默认的空参构造函数。
 * 可以声明const构造函数，这要求类的instance variable都是final的,
 * 只有声明了const构造函数的情况下，才可以在调用的时候声明const reference或者const value，这样在做==比对的时候返回true，如果只是普通调用，则在运行时生成普通的instance对象。
 * 声明了const构造函数的，必须在NamedConstructor中给final字段赋值
 * 默认而言，构造函数调用父类unnamed,no-argument构造函数（如果父类没有这个构造函数，子类必须手动的指定调用父类特定的构造函数），如果包含 initializer list则il最先执行，顺序是：
 * 1 initializer list(这个可以用于NamedConstructor或者常规的,在构造函数的参数之后，用：分隔，赋值语句用逗号分隔，位于function body的大括号前面，如果没有function body使用分号结束，通常用于给final field赋值，也可以在开发期间用assert语句排除非法输入)
 * 2 superclass’s no-arg constructor
 * 3 main class’s no-arg constructor
 *
 * NamedConstructor构造函数可以使用:this(params)重定向到本类常规的构造函数。这时候要求不能有function body
 *
 * Factory Constructor，可以使用factory关键词，函数名是类名(所以不能和常规的构造函数共存)，这种构造函数，可以在function body使用return语句，通常用于控制返回子类，或者单例等等。
 *
 *
 *
 * 属性：
 * 所有的field都包含隐式的getter，如果可以的也包含setter，我们可以使用关键词set和get来定义property，语法是：
 * returnType get propertyName {function body}
 * set propertyName(oneParam){function body}这里强调，set要求只能有一个参数
 *
 * 抽象函数：
 * 抽象的函数必须存在于抽象类
 * getter和setter也可以是抽象的，
 *
 * 隐式接口：
 * 所有的类都是一个接口，可以被implement，这种情况下，类定义的所有instance method都要求重写(包含只有getter或者setter的property)
 *
 * Extend：Dart支持单继承结构，在重写的情况下，如果要narrow函数的参数或者instance variable，可以使用关键词covariant表示协变
 *
 *
 */

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
  ClassDemo.nullInstance(String name) : name = name;

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

// ignore: slash_for_doc_comments
/**
 * 枚举：special kind of class used to represent a fixed number of constant values.
 *
 * 不同于java，Dart的枚举无法使用带有参数的构造函数，无法定义method
 * 枚举不能被集成，mixin，
 */

/**
 * mixin语法：
 * mixin用于向class添加feature，它提供了介于extend和implements的一种实现
 *
 * 在之前的dart版本中，用于mixin的class通常声明为abstract的，但是新的dart语法中，应该用mixin来声明专门用于with语法的类
 * 如果三者实现了同一个method，那么首先当前类的重写具有最高优先级，其次是with的类的优先级，with中最后一个类具有最高优先级，然后是extends的优先级，最后是implements(当然这种情况下比如当前类做重写了)
 * 在minxin中，对当前类使用is Type语法，返回对是true。这一点和接口类似。
 * 当我们想要在不共享相同类层次结构的多个类之间共享行为时，或者在超类中实现此类行为没有意义时，Mixins非常有用。比如Flutter中的RenderSliverHelpers
 * 还可以使用语法：mixin name on classname 来指定可以使用这个mixin的类必须是on后面的类的子类.使用mixin声明的类不能被实例化。
 * mixin语法还在发展，后续应该会有增强和完善。
 *
 */

/**
 * class variable and methods
 * class内部使用static修饰的variable和methods属于class层面的，不能通过类的instance来访问，直接使用类名来访问，当需要class-wide state and constants的时候这非常有用，否则应该使用top-level variable & methods
 * 官方对于怎么使用的建议是:Note: Consider using top-level functions, instead of static methods, for common or widely used utilities and functionality.
 */

// ignore: slash_for_doc_comments
/**
 * 泛型：
 * Dart支持真泛型，也就是泛型的信息是带入运行时的。
 * Dart中restrict一个泛型，只能使用extends（表示接受特定类型及其子类的类型作为泛型约定），不能使用super
 * 泛型针对class和method，由于泛型在Dart带入运行时，泛型可以直接用于一个变量的所有操作
 * 泛型method不可以脱离泛型类，也就是只能在泛型类内定义泛型method,泛型方法。泛型方法不能是static的。
 *
 */

class GenericDemo<T extends num> {
  T printGenericT(T t) {
    print(t.toString());
    return t;
  }
}

/**
 *  Library and visibility
 *
 *  每一个dart app都是一个library，即便不是显著的标明为一个Library
 *  以下划线开头命名的identifiers，只在当前Library可见
 *
 *  使用import来引入一个library，
 *  对于dart的内置库使用'dart:xxx'来引入
 *  对于外置的库使用：'package:xxx'来引入
 *  可以给一个库设置前缀，import 'package:xxx' as yyy
 *  可以部分引入一个库，import 'package:xxx' show xxxy或者hide xxxz
 *  还可以lazy load一个库，这个属于flutter web的内容，我没深入看。
 *
 *
 *  对于flutter而言：我么涉及的包有两种：
 *  1，dart package。这种包里面只有dart的代码
 *  2，flutter plugin，这种包还包含native端的代码
 *  3, 还有一种flutter module用于混合项目的开发，但是这个不适合我们的项目，没怎么看过。
 *
 */

// ignore: slash_for_doc_comments
/**
 * async support
 *
 * Dart中，异步函数支持的核心是Future和Stream
 * 使用async和await可以避免嵌套地狱，带来同步一般的异步写法。
 *
 * future的使用有两种选择
 * 1  使用async和await的组合
 * 2  使用[Future]的API
 */

/**
 *  Waiting for multiple futures。我们可以使用下面的语法来处理同时等待多个异步函数完成的情况。

    Future deleteLotsOfFiles() async =>  ...
    Future copyLotsOfFiles() async =>  ...
    Future checksumLotsOfOtherFiles() async =>  ...
    await Future.wait([
    deleteLotsOfFiles(),
    copyLotsOfFiles(),
    checksumLotsOfOtherFiles(),
    ]);
    print('Done with all the long steps!');
 */

/**
 * Streams。Stream objects appear throughout Dart APIs, representing sequences of data.
 * 我个人认为Stream最形象的比喻不是管道，而是流水线。
    对于Streams的处理有两种语法：
    1，可以使用await for（varOrType identifier in Stream) {}来处理所有的数据项。这样的使用必须在async下面。
    2. 可以使用.listen()的链式语法
    处理错误：
    对于使用await for的语法，应该使用try catch来处理错误。
    如果使用链式语法，可以注册onError来处理错误。
 */

/**
 * Reflection:反射语法：
 * 反射在Flutter中是禁止的，并且在官方目前是实验性质的，官方对应的核心库是mirror库，可以参加核心库预览："https://dart.dev/guides/libraries"
 * 反射的语法仍然是不稳定的，并且目前只是针对Dart VM & dart2js,所以感兴趣的私下了解。
 */
