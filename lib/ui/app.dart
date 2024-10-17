import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:identicon_generator/ui/res/color.dart';
import 'package:identicon_generator/ui/res/route.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';
import 'package:identicon_generator/ui/res/style.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    _initApp();

    return BlocProvider(
      create: (_) => IconBloc()..add(IconSettingsInitialized()),
      child: MaterialApp.router(
        routerConfig: router,
        theme: appTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.scriptCode == locale?.scriptCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }

  void _initApp() {
    // Initialize the system bar.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colorz.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
