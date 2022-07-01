import 'package:autohome/src/features/home_page/modules/add_device_screen/add_device_screen.dart';
import 'package:autohome/src/features/main_screen/main_screen.dart';
import 'package:autohome/src/features/splash/splash.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // final _router = GoRouter(routes: [
  //   GoRoute(path: "/", builder: (context, state) => const MainScreen()),
  //   GoRoute(path: "/add", builder: (context, state) => const AddDeviceScreen()),
  // ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF_Pro_Display', useMaterial3: true),
      title: 'Autohome',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashView(),
        '/home': (context) => const MainScreen(),
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
