# flutter_bloc_counter

An app showing the usage and principle of bloc

## Usage

- 定义自己的bloc，继承于bloc，重写initialState属性和mapEventToState方法
- 使用BlocProvider作为最外层的widget，构造函数传入T Function(BuildContext context)和child
- 在child的页面：使用BlocProvider.of<T>(context)的class方法来获取Bloc
- 在child的页面：使用BlocBuilder，构造函数传入Widget Function(BuildContext context, S state)来根据state构建widget

## Principle

flutter_bloc框架，主要包含三个由三个框架构成：flutter_bloc，bloc，provider
- provider框架的核心能力有两个：
    0. 提供在subtree中获取value的能力
    1. 提供value的dispose接口
- bloc框架的核心能力是提供两个BroadcastStream，用于管理event和state的转换

