import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/todoList.dart';

void main() {
  //不仅可以使用 WidgetTester 来找页面中的 widget，WidgetTester 还能帮助我们模拟输入，点击，滑动操作
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(TodoList());
    // 往输入框中输入 hi
    await tester.enterText(find.byType(TextField), 'hi');
    // 点击 button 来触发事件
    await tester.tap(find.byType(FloatingActionButton));
    // 让 widget 重绘
    await tester.pump();
    // 检测 text 是否添加到 List 中
    expect(find.text('hi'), findsOneWidget);

    // 测试滑动
    await tester.drag(find.byType(Dismissible), Offset(400.0, 0.0));

    // 页面会一直刷新，直到最后一帧绘制完成
    await tester.pumpAndSettle();

    // 验证页面中是否还有 hi 这个 item
    expect(find.text('hi'), findsNothing);
  });
}
