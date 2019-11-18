# flutter_bloc_counter

An app showing the usage and principle of bloc

## Usage

- 定义自己的bloc，继承于bloc，重写initialState属性和mapEventToState方法
- 使用BlocProvider作为最外层的widget，构造函数传入T Function(BuildContext context)和child
- 在child的页面：使用BlocProvider.of<T>(context)的class方法来获取Bloc
- 在child的页面：使用BlocBuilder，构造函数传入Widget Function(BuildContext context, S state)来根据state构建widget

## Principle

flutter_bloc框架主要由三个框架构成：flutter_bloc，bloc，provider，其中bloc和provider是两个独立的框架，而flutter_bloc依赖后两者
- provider框架的核心能力有两个：
    1. 提供在subtree中获取value的能力
    2. 提供value的dispose接口
- bloc框架的核心能力是提供两个BroadcastStream，用于管理event和state的转换，这个框架使用RxDart来和Stream打交道。鉴于RxDart的特性，可以在app的main方法配置自定义的BlockDelegate,重写onEvent，onTransition，onError方法，从而实现对全局所有的Bloc的上述方法进行hook操作。

