import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var url = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578475118487&di=f2f4ae55a9353a85942a1ae283f10719&imgtype=0&src=http%3A%2F%2Fpic16.nipic.com%2F20110911%2F6106165_160202658152_2.jpg";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/imgs/fengjing.jpg"),
        Image.network(url),
      ],
    );
  }
}
