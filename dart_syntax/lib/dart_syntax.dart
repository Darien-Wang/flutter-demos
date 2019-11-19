///
// ignore: slash_for_doc_comments
/**

 *
 *
 */



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
 * 官方对于Stream的介绍很少，这里有一些More Info::"https://dart.dev/guides/libraries/library-tour#more-information-1"
 * 我个人认为Stream最形象的比喻是流水线，而不是管道,具体的使用最好参考Stream和StreamController两个类的源码
 */

/**
 * Reflection:反射语法：
 * 反射在Flutter中是禁止的，并且在官方目前是实验性质的，官方对应的核心库是mirror库，可以参加核心库预览："https://dart.dev/guides/libraries"
 * 反射的语法仍然是不稳定的，并且目前只是针对Dart VM & dart2js,所以感兴趣的私下了解。
 */

/**
 * Typedefs:定义一个函数别名：定义函数的入参和返回类型。
 */

/**
 * Isolates：意味者隔离。
 * 在Dart里面，没有线程的概念，取而代之的是Isolate
 * Each isolate has its own memory heap, ensuring that no isolate’s state is accessible from any other isolate.
 *
 * 所以在Dart里面，没有多线程抢占的开销，但是有Isolate间通信的开销
 * 在面对IO密集场景的时候，建议使用单线程模型。Isolate主要面向计算密集的场景
 * 关于异步的开销可以看一篇阿里的公众号文章了解：https://mp.weixin.qq.com/s?__biz=MzIzOTU0NTQ0MA==&mid=2247491875&idx=1&sn=cb915675f6b1892d22bd434b372910c7&chksm=e92adc2cde5d553aad57ee1cc552744e1a43a5dfaa9a82444c41d557d1b3f7a05dd7b31b39e6&mpshare=1&scene=1&srcid=&sharer_sharetime=1574059736222&sharer_shareid=21d726102aad19c71aba0ca73ae8f9dd&pass_ticket=J8%2FnYKmjTGkQh%2BjCc4hg0LJToeKR1sjVCLaqOfzKzq5zfJmoWMlTORnzfAp80%2B96#rd
 * 关于Isolate的使用可以参考官方的demo：https://github.com/flutter/samples/tree/master/isolate_example
 */

