import 'package:flutter/material.dart';
import 'package:identicon_generator/ui/screens/splash/bloc/splash_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/res/route.dart';
import 'package:identicon_generator/ui/res/anim/animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SplashBloc(),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            context.pushReplacement(Routez.home.path);
          },
          listenWhen: (previous, current) => current.status.isEnded,
          child: Scaffold(
            body: Center(
              child: Lottie.asset(Animationz.splash.path, width: 150.0),
            ),
          ),
        ),
      );
}
