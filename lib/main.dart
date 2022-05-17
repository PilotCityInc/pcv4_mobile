import 'package:flutter/material.dart';
import 'package:pcv4_mobile/injection.dart';
import 'package:pcv4_mobile/presentation/app_widget.dart';

void main() {
  configureDependencies(Env.dev);
  runApp(AppWidget());
}
