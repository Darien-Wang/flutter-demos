import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          //注意Align是Column的直接子view，而column默认交叉轴对其是居中的
          //heightFactor和widthFactor决定了Align相对与child的大小，因为值可以小于1，所以child并不要求在Align的范围内
          //这个会首先把Align放在中间，然后Align的alignment属性决定了Align空间和child空间的那个角对齐
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              color: Colors.green,
            ),
          ),
          //Container没有child的话会尽量大，除非外部的约束是无限大（则container尽量小）
          //带有child赋值的container会根据child来决定自己的size
          //如果复写了width，height或者BoxConstraints，相应的约束被重写（比如只设定height，则height被重写，但是width还是通过child来计算）
          Container(
            color: Colors.red,
            height: 30,
            //AspectRation首先尝试width尽量大，height会根据width和ratio来计算
            //如果计算的height超过了外层约束，那么会取边界值反向计算width，直到宽高都符合外层约束
            //如果一直无法满足外层约束，会放弃aspectRation，而是根据child的size来选取宽高值，比如下面这个demo
            //在这个demo里面，高度30计算出来的宽度显然是60，
            //当然这个demo我在加一个width约束，因为根据width约束，height是15，这不符合30的约束
            //反过来，根据height计算的宽度是60，这不符合container的height必须是30的约束
            //所以这里AspectRatio约束失效，使用child的size，
            width:30,
            child: AspectRatio(
              aspectRatio: 18/9,
              child:Container(color: Colors.yellow,
              child: Text("Your Sister",style: TextStyle(fontSize: 16),),),
            ),
          ),
          //这个例子就展示了，当container的width，height，BoxConstraints都没有，指定第二顺位优先级，根据child来决定大小
          Container(
            child: Text("Hello World! Hello World",style: TextStyle(fontSize: 16),),
          )
        ]
      ),
    );
  }
}