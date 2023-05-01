import 'package:bitsgap/presentation/stores/authentication_store/authentication_store.dart';
import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class AuthenticationButtons extends StatelessWidget {
  final AuthenticationStore authStore;

  const AuthenticationButtons({
    required this.authStore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          height: context.height * 0.045,
          width: context.width,
          margin: EdgeInsets.only(
            top: context.height * .03,
            left: context.width * .065,
            right: context.width * .065,
            bottom: context.height * .05,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: authStore.currentAlignBackgroundButton,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: (context.height * 0.045),
                  width: (context.width / 2) - (context.width * .065),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      authStore.login(context);
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromWidth((context.width / 2) - (context.width * .065)),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFonts.fontSizeS,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      authStore.register();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromWidth((context.width / 2) - (context.width * .065)),
                      ),
                    ),
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorScheme.surface,
                        fontSize: AppFonts.fontSizeS,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
