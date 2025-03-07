import 'package:get_it/get_it.dart';
import 'package:stash_android/core/dialog/dialog_handler.dart';
import 'package:stash_android/core/navigation/navigation_bus.dart';

class BaseViewModel {
  BaseViewModel({
    NavigationBus? navigationBus,
    DialogHandler? dialogHandler,
  })  : navigationBus = navigationBus ?? GetIt.I(),
        dialogHandler = dialogHandler ?? GetIt.I();

  final NavigationBus navigationBus;
  final DialogHandler dialogHandler;

  void initialize() {}

  void dispose() {}
}
