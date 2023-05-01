import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/app_fonts.dart';

class LoginError extends StatelessWidget {
  final String? errorMessage;

  const LoginError({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorMessage != null,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              errorMessage ?? '',
              style: TextStyle(
                color: context.colorScheme.error,
                fontSize: AppFonts.fontSizeS,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
