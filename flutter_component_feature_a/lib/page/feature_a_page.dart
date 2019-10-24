import 'package:flutter/material.dart';

class FeatureAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature A')),
      body: Center(
        child: RaisedButton(
          child: Text('Feature A页面，点击打开FeatureB页面'),
          onPressed: () {
            Navigator.of(context).pushNamed("/featureb/pageb");
          },
        ),
      ),
    );
  }
}
