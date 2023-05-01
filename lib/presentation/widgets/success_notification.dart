import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class SuccessNotification extends StatelessWidget {
  final Animation<double> animation;

  const SuccessNotification({
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: Alignment(0.0, animation.value),
          child: Container(
            height: 60,
            width: 250,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.white,
                  size: 26,
                ),
                SizedBox(width: 15),
                Text(
                  'Registration successful!',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppFonts.fontSizeS,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
