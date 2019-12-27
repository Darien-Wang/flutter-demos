//展示使用并行动画
import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageFiveState();
}

class PageFiveState extends State<PageFive>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // #enddocregion addListener
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  // The Tweens are static because they don't change.
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ),
      ),
    );
  }
}
