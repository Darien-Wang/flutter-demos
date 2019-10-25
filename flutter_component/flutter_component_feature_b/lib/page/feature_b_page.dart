import 'package:flutter/material.dart';

class FeatureBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature B')),
      body: Center(
        child: Text(
          'Feature B Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
