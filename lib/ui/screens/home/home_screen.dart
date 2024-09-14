import 'package:flutter/material.dart';
import 'package:identicon_generator/ui/res/string/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO: Implement it.
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(S.current.appName),
        ),
      );
}
