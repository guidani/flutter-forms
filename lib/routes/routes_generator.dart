import 'package:flutter/material.dart';
import 'package:forms/pages/filter-api/filter_api_list_page.dart';
import 'package:forms/pages/filter-list/filter_static_list_page.dart';
import 'package:forms/pages/home/home.dart';
import 'package:forms/pages/light/light_page.dart';
import 'package:forms/pages/styleText/style_text_page.dart';
import 'package:forms/pages/zoom/zoom_image_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/style-text':
        return MaterialPageRoute(builder: (context) => const StyleTextPage());
      case '/light-page':
        return MaterialPageRoute(builder: (context) => const LightPage());
      case '/zoom-page':
        return MaterialPageRoute(builder: (context) => const ZoomImage());
      case '/filter-static-list':
        return MaterialPageRoute(builder: (context) => const FilterStaticList());
      case '/filter-api-list':
        return MaterialPageRoute(builder: (context) => const FilterApiList());
    }
    return MaterialPageRoute(builder: (context) => HomePage());
  }
}
