import 'package:flutter/material.dart';
import 'package:stash_android/core/app/app.dart';
import 'package:stash_android/core/dependencies/dependency_registry.dart';
import 'package:stash_android/core/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.hideLogs();
  await DependencyRegistry.register();
  runApp(const StashApp());
}
