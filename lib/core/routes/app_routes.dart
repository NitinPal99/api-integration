import 'package:api_integration/presentation/views/cart_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const cartScreen = '/';

  static Map<String, WidgetBuilder> pages = {
    '/': (context) => CartScreen(),
  };
}
