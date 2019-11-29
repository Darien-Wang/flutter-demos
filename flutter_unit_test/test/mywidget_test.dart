import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/mywidget.dart';

void main() {
  testWidgets("MyWidget has a title and message", (WidgetTester tester) async {
    // 加载 MyWidget
    await tester.pumpWidget(MyWidget(
      title: "T",
      message: "M",
    ));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // 验证页面中是否含有上述的两个 Text
    expect(titleFinder, findsNothing);
    expect(messageFinder, findsOneWidget);
  });
}
