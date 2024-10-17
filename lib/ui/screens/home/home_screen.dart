import 'dart:convert';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/res/color.dart';
import 'package:identicon_generator/ui/res/route.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';
import 'package:identicon_generator/ui/res/style.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

part 'package:identicon_generator/ui/screens/home/widgets/settings_button.dart';
part 'package:identicon_generator/ui/screens/home/widgets/prompts_text_field.dart';
part 'package:identicon_generator/ui/screens/home/widgets/icon_showcase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
        floatingActionButton: _FloatingActionButton(),
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
          _SettingsButton(),
          SizedBox(height: 8.0),
          _IconShowcase(),
        ],
      );
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => state.prompts.isEmpty
            ? const SizedBox.shrink()
            : FloatingActionButton.small(
                onPressed: () async {
                  final boundary = _iconKey.currentContext?.findRenderObject()
                      as RenderRepaintBoundary;
                  final image = await boundary.toImage(
                    pixelRatio: MediaQuery.of(context).devicePixelRatio,
                  );
                  final byteData =
                      await image.toByteData(format: ImageByteFormat.png);
                  final uint8List = byteData?.buffer.asUint8List();
                  if (uint8List != null) {
                    await Gal.putImageBytes(
                      uint8List,
                      name: S.current.homeSavedIconName,
                    );
                  }

                  final currentContext = _iconKey.currentContext;
                  if (currentContext != null && currentContext.mounted) {
                    ScaffoldMessenger.of(currentContext).showSnackBar(
                      SnackBar(
                        content: Text(
                          S.current.homeSavedSnackBarText,
                          style: TextStylez.regular16,
                        ),
                        action: SnackBarAction(
                          label: S.current.homeSavedSnackBarActionText,
                          onPressed: () async => Gal.open(),
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(Icons.save_alt_rounded, color: Colorz.black),
              ),
      );
}
