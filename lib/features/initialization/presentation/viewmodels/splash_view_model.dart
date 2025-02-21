import 'package:flutter/foundation.dart';
import 'package:stash_android/core/presentation/viewmodel/base_view_model.dart';


class SplashViewModel extends BaseViewModel {
  final ValueNotifier<int> _counter = ValueNotifier(0);
  ValueNotifier<int> get counter => _counter;

  void increment() async {
    _counter.value += 1;
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}
