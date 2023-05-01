import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/const.dart';

class AnimatedLoader extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> animation;
  final bool isVisible;

  const AnimatedLoader({
    required this.controller,
    required this.animation,
    required this.isVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: ColoredBox(
        color: AppColors.loadingBackground,
        child: Center(
          child: RotationTransition(
            turns: animation,
            child: Image.asset(
              AppImages.logo,
              height: context.height * .056,
            ),
          ),
        ),
      ),
    );
  }
}
