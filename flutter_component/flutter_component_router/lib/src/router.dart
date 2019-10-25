import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component_feature_a/page/feature_a_page.dart';
import 'package:flutter_component_feature_b/flutter_component_feature_b.dart';
import 'package:flutter_component_router/page/unknown_page.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

final Map<String, WidgetBuilder> routerMap = {
  RouteName.FEATURE_A_PAGE_A: (BuildContext context) => FeatureAPage(),
  RouteName.FEATURE_B_PAGE_B: (BuildContext context) => FeatureBPage(),
};

///Customized Navigator to constrain name of route
class ConnectedNavigator {
  static Future<T> pushNamed<T extends Object>(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }
}

Route routeFactory(RouteSettings settings) {
  Route route;
  if (routerMap.containsKey(settings.name)) {
    route = CupertinoPageRoute(
        builder: routerMap[settings.name], settings: settings);
  } else {
    route = MaterialPageRoute(
        builder: (context) => UnKnownPage(), settings: settings);
  }
  return route;
}
