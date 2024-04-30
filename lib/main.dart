import 'package:Formus/app/initialize.dart';
import 'package:Formus/start_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await initialize();
  appColorStart();
  runApp(
    FormusApp(),
  );
}

void appColorStart() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
