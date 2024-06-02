import 'package:cine_flix/common/constants/app_colors.dart';
import 'package:cine_flix/common/constants/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(38.0)
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(38.0)
          ),
          color: AppColors.deepBlue
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(38.0)
          ),
          onTap: onPressed,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(38.0)
              ),
            ),
            alignment: Alignment.center,
            height: 64.0,
            width: 358.0,
            child: Text(text,
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
