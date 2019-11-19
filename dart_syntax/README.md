# A app demo for Dart Syntax.

### this document is a supplement for [official document](https://dart.dev/guides/language/language-tour)
### this document focus on what is used frequently but the official document didn't explain in detail.

### 注释
- 单行注释
```
//这是一个单行注释
```
- 多行注释
```
/*
 *这是一个多行注释
 */
```
- 单行的文档注释
```
///这是一个单行的文档注释
```
- 多行的文档注释
```
/**
 *这是一个多行的文档注释
 */
```
### 重要的概念
1.  Dart中皆为对象，所有的对象都是class的实例，所有对象都直接或者间接继承于Object。即便是numbers，functions，null也是个对象
2.  Dart是强类型语言，但是类型声明不是强制的，可以通过类型推导获得，如果希望明确没有类型，可以使用[dynamic],注意：如果仅仅是想表达一个可以使用任何objects，应该使用Object。[dynamic的使用介绍](https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed)
3.  Dart支持泛型，支持泛型类和泛型函数。Dart的泛型是存在在运行时的，这意味这我们可以判定一个object is List<int>是Ok的。
4.  Dart支持top-level functions（比如main函数），绑定class或者object的functions（也就是static或者instance methods），也可以在函数内部创建函数（也就是nested或者local functions）
5.  Dart支持top-level variables，同时支持绑定class或者object的variables（也就是static或者instance variables），instance variables有时候又被称为字段或者属性
6.  Dart的访问控制不同于java，Dart可见行控制仅仅是library级别，如果一个对象是用_开头来命名的，那么就是library可见，否则就是到处可见的。
7.  标志符使用字母或者下划线（_）开头，后面可以是字母或者数字的任意组合
8.  Dart拥有expressions（which have runtime values）和statements（which don`t），简单理解，expression是拥有返回值的(包含void），后者比如if else语句，不具备返回值的能力。statement通常包含一个或者多个expression，but an expression can’t directly contain a statement.
9.  Dart tools可以报告两种问题：warnings和errors，前者只是警告代码可能不工作，但并不会影响执行。errors可以是编译期或者运行期。编译期错误会组织代码执行，运行期错误会产生exception
### [Dart的关键词](https://dart.dev/guides/language/language-tour#keywords),所有关键词不能作为identifier  
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
### [Variables](https://dart.dev/guides/language/language-tour#variables)  
    ```
    const topLevelConstString = 'Bob'; //可以定义一个Top Level的const reference
    class TheVariable {
      var name = 'Bob';//使用var关键词，隐式的使用了类似了类型推导。
      static const staticConstStringReference =
          "Bob"; //如果定义一个class level的const，必须使用static修饰。事实上因为const是编译期常量，必须使用static修饰。
      var constValue =
      const [
      ]; //this show define of const value,not const reference,这种情况，constValue可以重新指向新的值。
    }
    ```
### [Built-in types](https://dart.dev/guides/language/language-tour#built-in-types)
    numbers,strings,booleans,lists (also known as arrays),sets,maps,runes (for expressing Unicode characters in a string),symbols
    You can initialize an object of any of these special types using a literal. For example, 'this is a string' is a string literal, and true is a boolean literal.
    这块可以关注 spread operator（...）和null-aware spread operator (...?)，字符串模版，“raw” string， multi-line string，const list，const set，const map
    
### [Functions](https://dart.dev/guides/language/language-tour#functions)
    函数重点是：函数在Dart中同样是对象，类型是Function，所以可以像操作class一样使用Function，不如赋值给一个引用，作为函数的传参等。
    ```
    函数的定义语法
    returnType functionName(param) {
        expressions optional;
        return expr;
    }
    ```
    函数支持重写，不支持重载，也即是在Dart中同一个类内不允许有同名的函数（因为可选参数的存在，其实重载已经没有意义）。
    对于单行函数可以使用=>来直接返回,比如：bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
    对于函数，有两种参数： required and optional.
    对于optional参数，包含两种： named or positional。两种不能共存
    named params包裹在大括号内声明：void enableFlags({bool bold, bool hidden}) {...}，可以是使用@required来要求必须传递的named param
    positional params包裹在中括号声明：String say(String from, String msg, [String device]){}
    对于可选参数，可以使用=来定义默认值，否则默认值是null，
    Instance methods，属于绑定对象的函数，可以通过this访问，
    class methods,必须通过class访问，无法通过instance访问
    getters和setter是特殊的函数，用于提供read和write的控制，每个instance field包含隐式的getter and|or setter，
    
- 代码插入  
```
public static void mian() {
    print('it');
}
```


