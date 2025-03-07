import 'package:stash_android/core/navigation/navigation_intent.dart';
import 'package:rxdart/rxdart.dart';

abstract class NavigationBus {
  Stream<NavigationIntent> get stream;
  void emit(NavigationIntent intent) {}
}

class NavigationBusImpl implements NavigationBus {
  final _stream = BehaviorSubject<NavigationIntent>();

  @override
  BehaviorSubject<NavigationIntent> get stream => _stream;

  @override
  void emit(NavigationIntent intent) {
    _stream.add(intent);
  }
}
