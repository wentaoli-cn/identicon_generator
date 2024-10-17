part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.push(Routez.settings.path);
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
                S.current.homeSettingsButtonText,
                style: TextStylez.regular16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
