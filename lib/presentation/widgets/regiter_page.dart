import 'package:bitsgap/presentation/stores/authentication_store/authentication_store.dart';
import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/const.dart';
import 'app_text_field.dart';
import 'login_error.dart';

class RegisterPage extends StatelessWidget {
  final AuthenticationStore authStore;

  const RegisterPage({
    required this.authStore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * .065,
          ),
          child: Wrap(
            runSpacing: context.height * .017,
            runAlignment: WrapAlignment.end,
            children: [
              AppTextField(
                hintText: 'Email',
                controller: authStore.emailRegisterController,
                errorMessage: authStore.emptyErrorMessages[Const.registerEmailKey],
                textInputAction: TextInputAction.next,
                onChange: authStore.onRegisterEmailChange,
              ),
              AppTextField(
                hintText: 'Username',
                controller: authStore.userNameRegisterController,
                errorMessage: authStore.emptyErrorMessages[Const.registerUserNameKey],
                textInputAction: TextInputAction.next,
                onChange: authStore.onRegisterUserNameChange,
              ),
              AppTextField(
                hintText: 'Password',
                controller: authStore.passwordRegisterController,
                errorMessage: authStore.emptyErrorMessages[Const.registerPasswordKey],
                obscureText: true,
                onChange: authStore.onRegisterPasswordChange,
              ),
              LoginError(errorMessage: authStore.errorRegisterMessage),
            ],
          ),
        );
      },
    );
  }
}
