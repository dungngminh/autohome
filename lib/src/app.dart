import 'package:autohome/src/features/home_page/modules/add_device_screen/add_device_screen.dart';
import 'package:autohome/src/features/home_page/home_screen.dart';
import 'package:autohome/src/features/main_screen/main_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const MainScreen()),
    GoRoute(path: "/add", builder: (context, state) => const AddDeviceScreen()),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(fontFamily: "SF_Pro_Display"),
      title: "Autohome",
      routes: <String, WidgetBuilder>{
        '/': (context) => const MainScreen(),
        '/add': (context) => const AddDeviceScreen(),
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  // return MaterialApp.router(
  //   useInheritedMediaQuery: true,
  //   locale: DevicePreview.locale(context),
  //   debugShowCheckedModeBanner: false,
  //   builder: DevicePreview.appBuilder,
  //   theme: ThemeData(fontFamily: "SF_Pro_Display"),
  //   title: "Autohome", routeInformationParser: _router.routeInformationParser, routerDelegate: _router.routerDelegate,

  // );
  // }
}
