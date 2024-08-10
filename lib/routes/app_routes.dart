import 'package:flutter/cupertino.dart';
import 'package:mvp_arch/presentation/home_screen/home_screen.dart';

class AppRoutes {

  static final Map<String, WidgetBuilder> routes = {

    '/': (context) =>    HomeScreen(),

  };

}