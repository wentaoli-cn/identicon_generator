part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) => Text(
        S.current.homeExplanation,
        style: TextStylez.regular16,
      );
}
