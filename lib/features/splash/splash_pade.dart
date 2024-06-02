import 'package:cine_flix/common/constants/app_colors.dart';
import 'package:cine_flix/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cine_flix/features/onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Espera 3 segundos e navega para a página de onboarding
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.deepBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CiNe',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              'FLiX',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
