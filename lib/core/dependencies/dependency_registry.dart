import 'package:get_it/get_it.dart';
import 'package:stash_android/core/navigation/navigation_bus.dart';
import 'package:stash_android/core/dialog/dialog_handler.dart';

class DependencyRegistry {
  DependencyRegistry._();

  static Future<void> register() async {
    // Navigation
    GetIt.I.registerLazySingleton<NavigationBus>(() => NavigationBusImpl());

    // Dialog
    GetIt.I.registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());
  }
}
