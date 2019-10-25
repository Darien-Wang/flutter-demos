library flutter_component_router;

import 'package:flutter/cupertino.dart';
import 'package:flutter_component_feature_a/page/feature_a_page.dart';
import 'package:flutter_component_feature_b/flutter_component_feature_b.dart';

final Map<String, WidgetBuilder> routerMap = {
  '/featurea/pagea': (BuildContext context) => FeatureAPage(),
  '/featureb/pageb': (BuildContext context) => FeatureBPage(),
};
