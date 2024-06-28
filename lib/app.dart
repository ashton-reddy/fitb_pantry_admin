import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'OpenSans'),
      routerConfig: _router.config(),
    );
  }
}