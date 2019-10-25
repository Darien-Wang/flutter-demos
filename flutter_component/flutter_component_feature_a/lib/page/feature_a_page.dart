import 'package:flutter/material.dart';

class FeatureAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //receive args from route
    final String args = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Feature A')),
      body: Center(
        child: RaisedButton(
          child: Text('Feature A页面，点击打开FeatureB页面 \n $args'),
          onPressed: () {
            Navigator.of(context).pushNamed("/featureb/pageb");
          },
        ),
      ),
    );
  }
}
