part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

class _AdvancedButton extends StatelessWidget {
  const _AdvancedButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.push(Routez.advanced.path);
          },
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.settings_rounded,
                size: 24.0,
                color: Colorz.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                S.current.homeAdvancedButtonText,
                style: TextStylez.regular16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
