import 'package:api_integration/presentation/views/cart_screen.dart';
import 'package:api_integration/presentation/views/data_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const cartScreen = '/';
  static const dataScreen = '/dataScreen';

  static Map<String, WidgetBuilder> pages = {
    '/': (context) => CartScreen(),
    dataScreen: (context) => DataScreen()
  };
}
