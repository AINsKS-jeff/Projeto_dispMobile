import 'dart:developer';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/primary_button.dart';
import '../register/register_page.dart';
import '../login/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/main.png'),
            ),
            Text(
              'Cine Flix',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.deepBlue,
              ),
            ),
            Text(
              'O melhor do cine em suas mãos',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.deepBlue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Começar',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 16.0,
              ),
              child: const CustomTextButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Já tem uma conta? ',
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            'Log In',
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
    );
  }
}
