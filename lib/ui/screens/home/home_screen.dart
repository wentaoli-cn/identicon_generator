import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/res/color.dart';
import 'package:identicon_generator/ui/res/route.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';
import 'package:identicon_generator/ui/res/style.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

part 'package:identicon_generator/ui/screens/home/widgets/advanced_button.dart';

part 'package:identicon_generator/ui/screens/home/widgets/prompts_text_field.dart';

part 'package:identicon_generator/ui/screens/home/widgets/icon_showcase.dart';

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
        title: Text(
          S.current.homeTitle,
          style: TextStylez.bold20,
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
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        shrinkWrap: true,
        children: const [
          _PromptsTextField(),
          SizedBox(height: 8.0),
          _AdvancedButton(),
          SizedBox(height: 8.0),
          _IconShowcase(),
          // TODO: Implement it.
        ],
      );
}
