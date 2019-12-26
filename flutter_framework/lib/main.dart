import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text('跳转')),
        ),
      ),
    );
  }

  void printIt(BuildContext context) {
    print('===================');
    print("context.runtimeType = ${context.runtimeType}");
    print('runtimeType = $runtimeType');
    print('toStringShort = ${this.toStringShort()}');
    print('toString = ${this.toString()}');
    print('toStringDeep = ${this.toStringDeep()}');
    print('toStringShallow = ${this.toStringShallow()}');
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}