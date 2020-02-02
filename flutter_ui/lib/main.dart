import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/page/layout/layout_flow.dart';
import 'package:flutter_ui/page/layout/layout_flow_animation.dart';
import 'package:flutter_ui/page/layout/single_child_layout.dart';
import 'package:flutter_ui/page/page_one.dart';

void main(){
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          HomeListItem(title: 'Page ONE', page: PageOne(),),
          HomeListItem(title: 'Layout SingleChild', page: SingleChildLayout(),),
          HomeListItem(title: 'Layout Flow Animation', page: LayoutFlowAnimation(),),
          HomeListItem(title: 'Flow Layout', page: LayoutFlow(),),
        ],
      ),
    );
  }
}

class HomeListItem extends StatelessWidget {
  final String title;
  final Widget page;

  HomeListItem({@required this.title, @required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.black, width: 1))),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (_) => page));
      },
    );
  }
}
