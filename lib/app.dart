import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      routerConfig: _router.config(),
    );
  }
}