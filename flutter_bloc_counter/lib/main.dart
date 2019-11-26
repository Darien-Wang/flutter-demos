import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/page/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'bloc/CounterBloc.dart';

///全局的BlocDelegate
class AppBlocDelegate extends BlocDelegate {
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(
        "Global onError:bloc = $bloc error = $error stacktrace = $stacktrace");
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('Global onEvent:bloc = $bloc event = $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Global bloc = $bloc transition = $transition');
  }
}

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  //写法一：问题是在HomePage和CounterPage里面，在内部的view里面使用BlockProvider.of会报错BlocProvider.of() called with a context that does not contain a Bloc of type CounterBloc
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      home: BlocProvider<CounterBloc>(
//        builder: (context) => CounterBloc(),
//        child: HomePage(),
//      ),
//    );
//  }

  //写法二：对比写法一，只是调整了MaterialApp和BlocProvider的层级，不会有任何问题，这个为什么？和MaterialApp有关系吗？
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      builder: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
