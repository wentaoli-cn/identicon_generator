import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identicon_generator/ui/res/color.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';
import 'package:identicon_generator/ui/res/image/image.dart';
import 'package:identicon_generator/ui/res/style.dart';
import 'package:identicon_generator/ui/screens/home/bloc/home_bloc.dart';

part 'package:identicon_generator/ui/screens/home/widget/simple.dart';

part 'package:identicon_generator/ui/screens/home/widget/complex.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      );
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) => AppBar(
        leading: Image.asset(Imagez.logo.path, width: 18.0),
        title: Text(
          S.current.appName,
          style: TextStylez.bold18,
        ),
        elevation: 0.0,
        backgroundColor: Colorz.transparent,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            _Explanation(),
            SizedBox(height: 4.0),
            _PromptsTextField(),
            SizedBox(height: 8.0),
            _HashFunctionPicker(),
            SizedBox(height: 8.0),
            _GridTypeSlider(),
            SizedBox(height: 4.0),
            _IconSizeSlider(),
            // TODO: Implement it.
          ],
        ),
      );
}
