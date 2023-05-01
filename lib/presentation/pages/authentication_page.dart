import 'package:bitsgap/presentation/stores/authentication_store/authentication_store.dart';
import 'package:bitsgap/presentation/widgets/animated_loader.dart';
import 'package:bitsgap/presentation/widgets/authentication_buttons.dart';
import 'package:bitsgap/presentation/widgets/regiter_page.dart';
import 'package:bitsgap/utils/app_fonts.dart';
import 'package:bitsgap/utils/clippers/wave_clipper.dart';
import 'package:bitsgap/utils/const.dart';
import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/theme_store/theme_store.dart';
import '../widgets/login_page.dart';
import '../widgets/success_notification.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> with TickerProviderStateMixin {
  final _authStore = GetIt.I.get<AuthenticationStore>();

  final _themeStore = GetIt.I.get<ThemeStore>();

  late AnimationController _animationController;
  late Animation<double> _animation;

  late AnimationController _alignController;
  late Animation<double> _alignAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _alignController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _alignAnimation = Tween<double>(begin: -1.5, end: -0.8).animate(_alignController);

    _authStore.loadingStream.listen((bool isLoading) {
      if (isLoading) {
        _animationController.forward();
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    });

    _authStore.successNotifyStream.listen((_) {
      _alignController.forward();
      Future.delayed(const Duration(seconds: 3), () {
        _alignController.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: context.height * .3,
              color: context.colorScheme.secondary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.height * .064,
              left: context.width * .065,
            ),
            /// Click on the logo to change the theme
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _themeStore.changeTheme,
              child: Image.asset(
                AppImages.logo,
                height: context.height * .056,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.height * .1),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.height * .235,
                  maxHeight: context.height * .3,
                ),
                child: PageView(
                  controller: _authStore.pageController,
                  pageSnapping: false,
                  onPageChanged: _authStore.onPageChange,
                  children: [
                    LoginPage(
                      authStore: _authStore,
                    ),
                    RegisterPage(
                      authStore: _authStore,
                    ),
                  ],
                ),
              ),
              AuthenticationButtons(
                authStore: _authStore,
              ),
              TextButton(
                onPressed: null,
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.colorScheme.outline,
                    fontSize: AppFonts.fontSizeS,
                  ),
                ),
              ),
            ],
          ),
          Observer(
            builder: (context) {
              return AnimatedLoader(
                controller: _animationController,
                animation: _animation,
                isVisible: _authStore.isLoadingScreen,
              );
            },
          ),
          SuccessNotification(
            animation: _alignAnimation,
          ),
        ],
      ),
    );
  }
}
