import 'package:bitsgap/presentation/widgets/animated_loader.dart';
import 'package:bitsgap/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/app_fonts.dart';
import '../../utils/clippers/wave_clipper.dart';
import '../../utils/const.dart';
import '../stores/main_page_store/main_page_store.dart';
import '../stores/theme_store/theme_store.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  final _themeStore = GetIt.I.get<ThemeStore>();

  final _mainPageStore = GetIt.I.get<MainPageStore>();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _mainPageStore.loadingStream.listen((bool isLoading) {
      if (isLoading) {
        _animationController.forward();
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
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
          Center(
            child: TextButton(
              onPressed: () {
                _mainPageStore.logOut().then((value) => Navigator.pop(context));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.colorScheme.secondary),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontSize: AppFonts.fontSizeS,
                ),
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return AnimatedLoader(
                controller: _animationController,
                animation: _animation,
                isVisible: _mainPageStore.isLoadingScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}
