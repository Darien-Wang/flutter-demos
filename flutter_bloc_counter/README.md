# flutter_bloc_counter

An app showing the usage and principle of bloc

## 使用

- 定义自己的bloc，继承于bloc，重写initialState属性和mapEventToState方法
- 使用BlocProvider作为最外层的widget，构造函数传入T Function(BuildContext context)和child
- 在child的页面：使用BlocProvider.of<T>(context)的class方法来获取Bloc
- 在child的页面：使用BlocBuilder，构造函数传入Widget Function(BuildContext context, S state)来根据state构建widget

## 框架架构

flutter_bloc框架主要由三个框架构成：flutter_bloc，bloc，provider，其中bloc和provider是两个独立的框架，而flutter_bloc依赖后两者
- provider框架的核心能力有两个：
    1. 提供在subtree中获取value的能力
    2. 提供value的dispose接口
- bloc框架的核心能力是提供两个BroadcastStream，用于管理event和state的转换。这个框架使用RxDart来和Stream打交道。鉴于RxDart的特性，可以在app的main方法配置自定义的BlockDelegate,重写onEvent，onTransition，onError方法，从而实现对全局所有的Bloc的上述方法进行hook操作。
- flutter_bloc依赖上述两个框架的能力，使得在全局寻找bloc，管理bloc的流的生命周期，并使用bloc来分离并联系UI和逻辑层成为可能。

## [Provider框架](https://pub.flutter-io.cn/packages/provider)
    provider

## [bloc框架](https://pub.flutter-io.cn/packages/bloc)

## [flutter_bloc框架](https://pub.flutter-io.cn/packages/flutter_bloc)
关于flutter_bloc框架的类解读
- BlocBuilder类:
    这个类继承于BlocBuilderBase,而后者又直接继承自StatefulWidget。BlocBuilder只有一个const的构造函数，强制要求的传参是builder，这是一个函数类型，函数签名是：（context，state）=》Widget。这个只是用于widget的build方法返回一个widget。
  	BlocBuilder的构造函数里有一个bloc参数，如果这个参数不传递，则BlocBuilder会使用BlocProvider和当前的BuildContext自动执行查找。尽量不要在BlocBuilder内使用bloc参数，除非你确定你只想要一个当前类内的局部bloc，而不是可以通过父BlocProvider或者当前BuildContext可以访问的bloc。
  	BlocBuilder有一个condition参数：这个参数的签名是：（previousState, currentState) => bool,用于控制是否调用builder进行Widget重建（PS：我暂时没想到这个的用处，如果是用于去重或者debounce之类的话，似乎在自定义的bloc里面更合适）
- BlocProvider类:  
  	BlocProvider继承于ValueDelegateWidget（在Provider框架内）继承于DelegateWidget(也在Provider框架内)继承于StatefulWidget.
  	BlocProvider用于给自己的children提供bloc，子children使用BlocProvider.of<T>(context)来获取bloc，这样Widget的subtree获取的bloc是同一个instance。
  	BlocProvide有两个公开的构造函数，分别是BlocProvider(ValueBuilder<T> builder,Widget T)和BlocProvider.value(T value,Widget child).BlocProvider的类泛型是Bloc<dynamic, dynamic>的子类，所以ValueBuilder<T>的签名是（context） =》 T。前者构造函数和后者NamedConstructor的区别是前者会对Bloc进行自动的close（因为这个通常这里的bloc应该是new出来的，不应该使用现有的bloc，不然会被注销掉，从而使得bloc原来绑定的页面无法刷新），但是后者是不注销bloc的。利用这一点，可以在相邻的两个页面使用同一个bloc进行页面的管理。
- MultiBlocProvider类:  
  	如果涉及向一个route注入多个BlocProvider，可以使用BlocProvider嵌套的写法，但是flutter_bloc提供了更加简洁的封装：MultiBlocProvider。
  	MultiBlocProvider直接继承于StateLessWidget，构造函数只有一个：MultiBlocProvider(List<BlocProvider> providers,Widget child),这也是该类的两个field，
- BlocListener类:    
  	BlocListener继承于BlocListenerBase继承于StatefulWidget，用于当state变化的时候，调用BlocWidgetListener(签名：（context，state) =》 void）进行一个操作，通常该操作应该是适用于当state每次改变后调用一次的，比如navigation，showing a snackBar，showing a dialog等等。
  	类似BlocBuilder，如果构造函数的bloc参数被省略的话，会从BlocProvider或者当前BuildContext查找bloc。所以类似于BlocBuilder，一般不应该传递bloc参数。
  	同样类似于BlocBuilder，BlocListener的构造函数可以传递一个condition参数，基于previousState和currentState决定是否调用BlocWidgetListener。
- MultiBlocListener类:   	
  	类似于BlocProvider，flutter_bloc框架提供了MultiBlocListener，来解决BlocListener嵌套的问题。
  	MultiBlocListener继承于StatelessWidget，同样只包含了List<BlocListener>和Widget child两个属性，构造函数也只是向这两个属性赋值。
  	BlocListener的泛型和BlocBuilder一样，是<bloc, state>，

