import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home.dart';

final Logger _log = Logger();

/// Determines what [PageRoute] is used for the new route.
///
/// This determines the transition animation for the new route.
enum RouteType {
  defaultRoute,
  fade,
}

/// The [AppNavigator] contains the [Navigator] key used by the root
/// [MaterialApp]
///
/// This allows for navigation without access to the [BuildContext]
class AppNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState? get state => key.currentState;

  void pop<T extends Object>([T? result]) => state?.pop<T>(result);

  void popUntil<T extends Object>(RoutePredicate predicate) =>
      state?.popUntil(predicate);

  void popUntilNamed(String route) =>
      state?.popUntil(ModalRoute.withName(route));

  void popUntilWithParam<T extends Object>(RoutePredicate predicate) =>
      state?.popUntil(predicate);

  Future<bool>? maybePop<T extends Object>([T? result]) =>
      state?.maybePop(result);

  Future<T?>? push<T>(Route<T> route) => state?.push(route);

  void pushReplacementNamed(String route,
      {RouteType type = RouteType.defaultRoute,
      Map<String, dynamic>? arguments}) {
    state?.pushReplacementNamed(route,
        arguments: <String, dynamic>{'routeType': type, ...?arguments});
  }

  void pushNamed(String route,
      {RouteType type = RouteType.defaultRoute,
      Map<String, dynamic>? arguments}) {
    state?.pushNamed(route,
        arguments: <String, dynamic>{'routeType': type, ...?arguments});
  }

  void pushNamedAndRemoveUntil(String route,
      {bool Function(Route<dynamic>)? predicate,
      RouteType type = RouteType.defaultRoute,
      Map<String, dynamic>? arguments}) {
    state?.pushNamedAndRemoveUntil(route, predicate ?? (route) => false,
        arguments: <String, dynamic>{'routeType': type, ...?arguments});
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  _log.i('Navigating to $routeName');

  final arguments =
      settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};
  RouteType routeType =
      arguments['routeType'] as RouteType? ?? RouteType.defaultRoute;

  Widget screen;

  switch (routeName) {
    case '/':
    case DashboardHome.route:
      screen = const DashboardHome();
      break;


    default:
      screen = const DashboardHome();
  }

  switch (routeType) {
    case RouteType.fade:
      return MaterialPageRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );

    case RouteType.defaultRoute:
      return MaterialPageRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );

    default:
      return MaterialPageRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
  }
}
