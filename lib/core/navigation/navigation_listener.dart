import 'package:get_it/get_it.dart';
import 'package:stash_android/core/navigation/navigation_bus.dart';
import 'package:stash_android/core/navigation/navigation_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationListener extends StatefulWidget {
  const NavigationListener({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final Key navigatorKey;

  @override
  State<NavigationListener> createState() => _NavigationListenerState();
}

class _NavigationListenerState extends State<NavigationListener> {
  late final _navigationHandler = _NavigationHandler(
    navigatorKey: widget.navigatorKey as GlobalKey<NavigatorState>,
  );

  void _listener(NavigationIntent intent) {
    _navigationHandler.overrideKey(intent.navigatorKeyOverride);
    _navigationHandler.handle(intent);
  }

  @override
  void initState() {
    super.initState();
    GetIt.I<NavigationBus>().stream.listen(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.of(context).maybePop();
      },
      child: widget.child,
    );
  }
}

class _NavigationHandler {
  /// Constructs a _NavigationHandler instance
  _NavigationHandler({required this.navigatorKey})
      : _navigatorKeyCopy = navigatorKey;

  late GlobalKey<NavigatorState> navigatorKey;
  // ignore: prefer_final_fields
  late GlobalKey<NavigatorState> _navigatorKeyCopy;

  void overrideKey(GlobalKey<NavigatorState>? key) {
    if (key == null) {
      navigatorKey = _navigatorKeyCopy;
    } else {
      navigatorKey = key;
    }
  }

  NavigatorState? get _state => navigatorKey.currentState;

  void handle(NavigationIntent intent) {
    switch (intent.strategy) {
      case NavigationStrategy.push:
        _state?.pushNamed(
          intent.route,
          arguments: intent.args,
        );
        break;
      case NavigationStrategy.pushAndRemoveUntil:
        _state?.pushNamedAndRemoveUntil(
          intent.route,
          ModalRoute.withName(intent.otherRoute),
          arguments: intent.args,
        );
        break;
      case NavigationStrategy.pushReplacement:
        _state?.pushReplacementNamed(
          intent.route,
          arguments: intent.args,
        );
        break;
      case NavigationStrategy.popAndPush:
        _state?.popAndPushNamed(intent.route, arguments: intent.args);

        break;
      case NavigationStrategy.pop:
        _state?.pop(intent.args);
        break;
      case NavigationStrategy.popUntil:
        _state?.popUntil(ModalRoute.withName(intent.route));
        break;
      case NavigationStrategy.exitApp:
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        break;
    }
  }
}
