import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stash_android/core/routes/routes.dart';
import 'package:stash_android/features/initialization/presentation/screens/contact/contact_home.dart';

class RouteGenerator {
  /// Generates routes, extracts and passes navigation arguments.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.contactScreen:
        return _getPageRoute(
          const ContactHomeScreen(),
          Routes.contactScreen,
        );

      default:
        return _getPageRoute(_errorScreen());
    }
  }

  /// Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    String? routeName,
    dynamic args,
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        settings: RouteSettings(
          name: routeName,
          arguments: args,
        ),
      );

  /// Error screen shown when app attempts navigating to an unknown route
  static Widget _errorScreen({String message = "Error! Screen not found"}) =>
      Scaffold(
        appBar: AppBar(
            title: const Text(
          'Screen not found',
          style: TextStyle(color: Colors.red),
        )),
        body: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
}
