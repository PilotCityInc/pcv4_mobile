import 'package:flutter/material.dart';
import 'package:pcv4_mobile/injection.dart';
import 'package:pcv4_mobile/presentation/app_widget.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  configureDependencies(Env.dev);
  runApp(AppWidget());
}
