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
- bloc是business logic component的缩写，bloc在dart里面实现了[Bloc pattern](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/)
- flutter_bloc依赖上述两个框架的能力，使得在全局寻找bloc，管理bloc的流的生命周期，并使用bloc来分离并联系UI和逻辑层成为可能。

## [Provider框架](https://pub.flutter-io.cn/packages/provider)
#### A mixture between dependency injection (DI) and state management, built with widgets for widgets.
因为我们的重点是flutter_bloc框架，我们着重介绍flutter_bloc依赖的**ValueDelegateWidget**类
- **ValueDelegateWidget**:
    这个类核心就是把相关的操作代理改了StateDelegate类，这个抽象类实现了initDelegate，didUpdateDelegate，dispose的空实现，子类有不同的实现，
    其中对于通过默认构造函数构建的BlocProvider是使用了BuilderStateDelegate，在它的disposer里面对持有的bloc进行了close操作

## [bloc框架](https://pub.flutter-io.cn/packages/bloc)
#### A dart package that helps implement the BLoC pattern.
- **BlocSupervisor**  
    一个持有BlocDelegate的单例
- **BlocDelegate**  
    一个持有onEvent，onTransition,onError三个方法的类，用于所有bloc的hook操作
- **Bloc**
    Bloc继承于Stream并实现了Sink接口，或者提供了add(添加事件)和close(关闭管理event的PublishSubject和管理state的BehaviorSubject)方法
    Bloc是一个抽象类，暴露了两个接口，一个是initialState属性，另外一个是mapEventToState方法，该方法返回一个Stream<state>的流
    默认构造函数，实现了基于initialState的赋值 _stateSubject = BehaviorSubject<State>.seeded(initialState);
    默认构造函数，实现了基于mapEventToState方法返回的流的forEach监听，当流里面有不同的event出现，并且_stateSubject尚未close，则会把state向_stateSubject发送

## [flutter_bloc框架](https://pub.flutter-io.cn/packages/flutter_bloc)
#### A Flutter package that helps implement the BLoC pattern.因为除此之外还有针对angular的实现
关于flutter_bloc框架的类解读
- **BlocBuilder类:**  
    这个类继承于BlocBuilderBase,而后者又直接继承自StatefulWidget。BlocBuilder只有一个const的构造函数，强制要求的传参是builder，这是一个函数类型，函数签名是：（context，state）=》Widget。这个只是用于widget的build方法返回一个widget。
  	BlocBuilder的构造函数里有一个bloc参数，如果这个参数不传递，则BlocBuilder会使用BlocProvider和当前的BuildContext自动执行查找。尽量不要在BlocBuilder内使用bloc参数，除非你确定你只想要一个当前类内的局部bloc，而不是可以通过父BlocProvider或者当前BuildContext可以访问的bloc。
  	BlocBuilder有一个condition参数：这个参数的签名是：（previousState, currentState) => bool,用于控制是否调用builder进行Widget重建（PS：我暂时没想到这个的用处，如果是用于去重或者debounce之类的话，似乎在自定义的bloc里面更合适）
  	BlocBuilder源于StatefulWidget，在对应的State类initState方法里面对bloc进行了订阅，在对应的dispose方法进行了取消订阅
- **BlocListener类:** 
    BlocListener继承于BlocListenerBase继承于StatefulWidget，用于当state变化的时候，调用BlocWidgetListener(签名：（context，state) =》 void）进行一个操作，通常该操作应该是适用于当state每次改变后调用一次的，比如navigation，showing a snackBar，showing a dialog等等。
  	类似BlocBuilder，如果构造函数的bloc参数被省略的话，会从BlocProvider或者当前BuildContext查找bloc。所以类似于BlocBuilder，一般不应该传递bloc参数。
  	同样类似于BlocBuilder，BlocListener的构造函数可以传递一个condition参数，基于previousState和currentState决定是否调用BlocWidgetListener。
- **BlocProvider类:**  
    BlocProvider继承于ValueDelegateWidget（在Provider框架内）继承于DelegateWidget(也在Provider框架内)继承于StatefulWidget.
  	BlocProvider用于给自己的children提供bloc，子children使用BlocProvider.of<T>(context)来获取bloc，这样Widget的subtree获取的bloc是同一个instance。
  	BlocProvide有两个公开的构造函数，分别是BlocProvider(ValueBuilder<T> builder,Widget T)和BlocProvider.value(T value,Widget child).
  	BlocProvider的类泛型是Bloc<dynamic, dynamic>的子类，所以ValueBuilder<T>的签名是（context） => T。前者构造函数和后者NamedConstructor的区别是前者会对Bloc进行自动的close（因为这个通常这里的bloc是new出来的，不应该使用现有的bloc，不然会被注销掉，从而使得bloc原来绑定的页面无法刷新），但是后者是不注销bloc的。利用这一点，可以在相邻的两个页面使用同一个bloc进行页面的管理。
  	blocProvider复写了build方法,这个build方法在对应的State类内build方法会调用，返回的是一个InheritedWidget的子类。这个类是共享bloc的关键。(因为framework层有hashMap存储，这里查找对应类的时间开销是O1)
  	State对应的dispose方法会触发BlocProvider的Delegate的dispose方法，这里对于新创建的会调用bloc?.close,对于通过value构造函数创建的BlocProvider这个实现是empty的所以doNothing。
- **MultiBlocListener类:**  
    类似于BlocProvider，flutter_bloc框架提供了MultiBlocListener，来解决BlocListener嵌套的问题。
  	MultiBlocListener继承于StatelessWidget，同样只包含了List<BlocListener>和Widget child两个属性，构造函数也只是向这两个属性赋值。
  	BlocListener的泛型和BlocBuilder一样，是<bloc, state>
- **MultiBlocProvider类:**
    如果涉及向一个route注入多个BlocProvider，可以使用BlocProvider嵌套的写法，但是flutter_bloc提供了更加简洁的封装：MultiBlocProvider。
  	MultiBlocProvider直接继承于StateLessWidget，构造函数只有一个：MultiBlocProvider(List<BlocProvider> providers,Widget child),这也是该类的两个field，
- **MultiRepositoryProvider类:**  
    类似于MultiBlocProvider，我们可以使用MultiRepositoryProvider来避免嵌套式的声明。同样MultiRepositoryProvider只有两个属性，分别是：List<RepositoryProvider> providers和Widget child。
- **RepositoryProvider类:**  
    RepositoryProvider不同于BlocProvider的继承关系在于，RepositoryProvider直接继承于Provider(Provider框架)，而Provider才和BlocProvider一样继承于ValueDelegateWidget。
	RepositoryProvider不同于BlocProvider的泛型关系在于，前者的泛型是T，没有任何约束，后者的泛型是<T extends Bloc<dynamic, dynamic>>,
	RepositoryProvider用于向subtree提供一个repository，children使用RepositoryProvider.of<T>(context)来获取同一个repository的instance。
	类似于BlocProvider的API，RepositoryProvider同样提供了.value构造函数来构造，这里要求泛型T应该使用现有的，而不是new出来的。
	从源码层面来看，RepositoryProvider只是在Provider的基础上增加了static T of<T>(context)方法，该方法其实也是调用了Provider的static T of<T>（context，listen:false）方法，所以可以视为对Provider的简单包装。  
	  


