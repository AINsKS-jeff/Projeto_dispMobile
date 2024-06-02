import 'package:flutter/material.dart';
import 'package:cine_flix/features/onboarding/onboarding_page.dart';
import 'package:cine_flix/features/splash/splash_pade.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}