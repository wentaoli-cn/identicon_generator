import 'package:flutter/material.dart';
import 'package:identicon_generator/data/di/get_it.dart';
import 'package:identicon_generator/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const App());
}
