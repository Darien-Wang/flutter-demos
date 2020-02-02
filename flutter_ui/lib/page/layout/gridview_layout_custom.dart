//演示gridview.custom
//custom要求必须指定delegate和childrenDelegate
//看起来这个的构造

import 'package:flutter/material.dart';

class GridViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = getDataList();
    return Material(
      child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          childrenDelegate: SliverChildBuilderDelegate((context, position) {
            return getItemContainer(items[position]);
          }, childCount: items.length)),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }
}
