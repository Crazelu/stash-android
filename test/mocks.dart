import 'package:mockito/annotations.dart';
import 'package:stash_android/core/dialog/dialog_handler.dart';
import 'package:stash_android/core/navigation/navigation_bus.dart';

@GenerateNiceMocks([
    MockSpec<DialogHandler>(),
    MockSpec<NavigationBus>(),
    ])
void main() {}