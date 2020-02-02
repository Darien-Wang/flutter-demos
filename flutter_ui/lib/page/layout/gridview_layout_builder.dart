//演示gridview.builder
//builder写法必须自己指定grid delegate,这个参数用来指定grid view的构建方式
//以下有几个常用的系统内置的delegate：
///[SliverGridDelegateWithMaxCrossAxisExtent]maxCrossAxisExtent指定交叉轴最大尺寸，具体的crossAxisCount由屏幕宽度和尺寸和padding来计算
///[SliverGridDelegateWithFixedCrossAxisCount]用来指定cross axis的数量

import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = getDataList();
    return Material(
      child: GridView.builder(
          itemCount: items.length,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 20.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            //Widget Function(BuildContext context, int index)
            return getItemContainer(items[index]);
          }),
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
