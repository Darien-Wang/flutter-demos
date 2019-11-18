import 'package:flutter/material.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/CounterBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //写法一：问题是在HomePage和CounterPage里面，在内部的view里面使用BlockProvider.of会报错BlocProvider.of() called with a context that does not contain a Bloc of type CounterBloc
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
