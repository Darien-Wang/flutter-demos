import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

void main() {
  group("RouteName", () {
    print(RouteName.FEATURE_A_PAGE_A.toString());
    test("contain feature a page a", () {
      RouteName.values.contains(RouteName.FEATURE_A_PAGE_A);
    });
  });
}
