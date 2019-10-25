import 'package:flutter/material.dart';
import 'package:flutter_component_router/flutter_component_router.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: routerMap,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('启动页面'),
      onPressed: () {
        ConnectedNavigator.pushNamed(context, RouteName.FEATURE_A_PAGE_A,
            arguments: "你好，Page A，我是HOME PAGE");
        Navigator.of(context)
            .pushNamed("/featurea/pagea", arguments: "你好，pageA");
      },
    );
  }
}
