import 'package:flutter/widgets.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:stash_android/core/dialog/dialog_routes.dart';

class DialogGenerator {
  static Widget? onGenerateDialog(DialogSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case DialogRoutes.error:
        // return ErrorDialog()
        return null;

      default:
        return null;
    }
  }
}
