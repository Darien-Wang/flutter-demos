import 'package:flutter/material.dart';
import 'package:flutter_component_router/flutter_component_router.dart';

class FeatureBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature B')),
      body: Center(
        child: RaisedButton(
          child: Text('这里是B页面 \n 点击打开未知页面'),
          onPressed: () {
            ConnectedNavigator.pushNamed(context, "hhh,随便写一个名字");
          },
        ),
      ),
    );
  }
}
