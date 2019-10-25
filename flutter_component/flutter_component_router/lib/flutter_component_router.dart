library flutter_component_router;

import 'package:flutter/cupertino.dart';
import 'package:flutter_component_feature_a/page/feature_a_page.dart';
import 'package:flutter_component_feature_b/flutter_component_feature_b.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

final Map<String, WidgetBuilder> routerMap = {
  RouteName.FEATURE_A_PAGE_A.toString(): (BuildContext context) =>
      FeatureAPage(),
  RouteName.FEATURE_B_PAGE_B.toString(): (BuildContext context) =>
      FeatureBPage(),
};

class ConnectedNavigator {
  static Future<T> pushNamed<T extends Object>(BuildContext context,
      RouteName routeName,
      {Object arguments}) {
    return Navigator.of(context)
        .pushNamed(routeName.toString(), arguments: arguments);
  }
}
