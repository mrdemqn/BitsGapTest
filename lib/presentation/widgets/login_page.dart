import 'package:bitsgap/presentation/stores/authentication_store/authentication_store.dart';
import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/const.dart';
import 'app_text_field.dart';
import 'login_error.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationStore authStore;

  const LoginPage({
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
                hintText: 'Username',
                controller: authStore.userNameLoginController,
                errorMessage: authStore.emptyErrorMessages[Const.loginUserNameKey],
                textInputAction: TextInputAction.next,
                onChange: authStore.onLoginUserNameChange,
              ),
              AppTextField(
                hintText: 'Password',
                controller: authStore.passwordLoginController,
                errorMessage: authStore.emptyErrorMessages[Const.loginPasswordKey],
                obscureText: true,
                onChange: authStore.onLoginPasswordChange,
              ),
              LoginError(errorMessage: authStore.errorLoginMessage),
            ],
          ),
        );
      },
    );
  }
}
