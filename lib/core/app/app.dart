import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stash_android/core/navigation/navigation_listener.dart';
import 'package:stash_android/core/dialog/dialog_generator.dart';
import 'package:stash_android/core/dialog/dialog_handler.dart';
import 'package:stash_android/core/routes/route_generator.dart';
import 'package:stash_android/core/routes/routes.dart';
import 'package:stash_android/core/localization/app_localizations.dart';

class StashApp extends StatefulWidget {
  const StashApp({super.key});

  @override
  State<StashApp> createState() => _StashAppState();
}

class _StashAppState extends State<StashApp> {
  late final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return DialogManager(
      dialogKey: GetIt.I<DialogHandler>().dialogKey,
      navigatorKey: _navigatorKey,
      onGenerateDialog: DialogGenerator.onGenerateDialog,
      child: MaterialApp(
        scrollBehavior: const _StashScrollBehavior(),
        title: 'Stash',
        localizationsDelegates: const [
          StashLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: Routes.contactScreen,
        navigatorKey: _navigatorKey,
        builder: (_, child) => NavigationListener(
          navigatorKey: _navigatorKey,
          child: child!,
        ),
      ),
    );
  }
}

/// Removes glowing scroll indicator on Android
class _StashScrollBehavior extends ScrollBehavior {
  const _StashScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
