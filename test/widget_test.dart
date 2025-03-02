import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:stash_android/core/app/app.dart';
import 'package:stash_android/core/dialog/dialog_handler.dart';
import 'package:stash_android/core/navigation/navigation_bus.dart';
import 'package:stash_android/core/localization/app_localizations_en.dart';

import 'mocks.mocks.dart';

void main() {
  setUpAll(
    () {
      GetIt.I.registerSingleton<DialogHandler>(
        MockDialogHandler(),
      );
      GetIt.I.registerSingleton<NavigationBus>(
        MockNavigationBus(),
      );
    },
  );
  testWidgets('StashApp test', (WidgetTester tester) async {
    when(GetIt.I<DialogHandler>().dialogKey).thenReturn(GlobalKey());

    await tester.pumpWidget(const StashApp());

    final localization = StashLocalizationsEn();

    // expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('Ella'), findsOneWidget);
    expect(find.text('Language: ${localization.language}'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Ella!'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    
    expect(find.text('Ella!!'), findsOneWidget);
  });
}
