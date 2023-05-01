import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:bitsgap/utils/regexp_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_fonts.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final void Function(String) onChange;
  final String? errorMessage;
  final TextInputAction? textInputAction;

  const AppTextField({
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.obscureText = false,
    this.errorMessage,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChange,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        errorText: errorMessage,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        errorStyle: TextStyle(
          color: context.colorScheme.error,
          fontSize: AppFonts.fontSizeS,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.colorScheme.surface,
          fontSize: AppFonts.fontSizeM,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.only(
          left: 16,
          top: 12,
          bottom: 12,
        ),
      ),
      style: TextStyle(
        color: context.colorScheme.surface,
        fontSize: AppFonts.fontSizeM,
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegexpExpressions.emptyTextFieldRegExp),
        LengthLimitingTextInputFormatter(20),
      ],
    );
  }
}
