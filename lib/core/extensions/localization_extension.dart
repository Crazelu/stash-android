import 'package:stash_android/core/localization/app_localizations.dart';
import 'package:stash_android/core/localization/app_localizations_en.dart';
import 'package:flutter/material.dart';

extension StashLocalizationExtension on BuildContext {
  StashLocalizations get localization =>
      StashLocalizations.of(this) ?? StashLocalizationsEn();
}
