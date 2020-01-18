import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/page/page_one.dart';

void main() => runApp(MyApp());

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
          HomeListItem(
              title: 'Page ONE',
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (_) => PageOne()));
                print('宽度 = ${MediaQuery.of(context).size.width}');
              })
        ],
      ),
    );
  }
}

class HomeListItem extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  HomeListItem({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      onTap: onTap,
    );
  }
}
