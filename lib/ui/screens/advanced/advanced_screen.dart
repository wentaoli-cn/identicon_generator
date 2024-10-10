import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identicon_generator/ui/res/color.dart';
import 'package:go_router/go_router.dart';
import 'package:identicon_generator/ui/res/style.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';
import 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';
import 'package:identicon_generator/ui/utils/color_utils.dart';

part 'package:identicon_generator/ui/screens/advanced/widgets/color_picker.dart';

part 'package:identicon_generator/ui/screens/advanced/widgets/hash_function_picker.dart';

part 'package:identicon_generator/ui/screens/advanced/widgets/slider.dart';

class AdvancedScreen extends StatelessWidget {
  const AdvancedScreen({super.key});

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) {
            return;
          }
          if (_HashFunctionPicker.isExpanded) {
            return;
          }
          if (_ColorPicker.isExpanded) {
            return;
          }
          context.pop();
        },
        child: const Scaffold(
          appBar: _AppBar(),
          body: _Body(),
        ),
      );
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 24.0,
            color: Colorz.white,
          ),
        ),
        title: Text(S.current.advancedTitle, style: TextStylez.bold20),
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
          _HashFunctionPicker(),
          SizedBox(height: 8.0),
          _GridTypeSlider(),
          SizedBox(height: 8.0),
          _IconSizeSlider(),
          SizedBox(height: 8.0),
          _ColorPicker(),
          // TODO: Implement it.
        ],
      );
}
