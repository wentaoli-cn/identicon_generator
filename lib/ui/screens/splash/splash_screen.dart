import 'package:flutter/material.dart';
import 'package:identicon_generator/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/res/route.dart';
import 'package:identicon_generator/ui/res/anim/animation.dart';
import 'package:identicon_generator/ui/res/font/font.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SplashBloc(),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, _) {
            context.pushReplacement(Routez.home.path);
          },
          listenWhen: (_, current) => current.status.isEnded,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(Animationz.splash.path, width: 100.0),
                  Text(
                    S.current.appName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: Fontz.ubuntuMono.name,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
