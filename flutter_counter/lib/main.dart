import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "counter app",
      home: BlocProvider(
        builder: (context) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}
