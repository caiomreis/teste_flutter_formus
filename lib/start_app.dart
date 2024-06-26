import 'package:Formus/app/router/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FormusApp extends StatelessWidget {
  final routerObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

  FormusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Formus Teste',
      initialRoute: '/home',
      getPages: Routes.router,
      navigatorObservers: [routerObserver],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
