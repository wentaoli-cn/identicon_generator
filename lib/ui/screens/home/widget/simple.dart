part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) => Text(
        S.current.homeExplanation,
        style: TextStylez.regular16,
      );
}

class _Slider extends StatelessWidget {
  const _Slider({
    required this.title,
    required this.value,
    required this.description,
    required this.min,
    required this.max,
    this.onChange,
  });

  final String title;
  final double value;
  final String description;
  final double min;
  final double max;
  final ValueChanged<double>? onChange;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStylez.regular12.copyWith(color: Colorz.darkGray),
          ),
          Slider(
            value: value,
            onChanged: onChange,
            min: min,
            max: max,
            activeColor: Colorz.white,
            inactiveColor: Colorz.darkGray,
            overlayColor: const WidgetStatePropertyAll(Colorz.transparent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                description,
                style: TextStylez.regular16,
              ),
            ],
          ),
        ],
      );
}

class _GridTypeSlider extends StatelessWidget {
  const _GridTypeSlider();

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _Slider(
          title: S.current.homeGridTypeHelper,
          value: state.gridType,
          description: S.current.homeGridTypeDescription(state.gridType),
          min: HomeState.gridTypeMin,
          max: HomeState.gridTypeMax,
          onChange: (value) {
            context
                .read<HomeBloc>()
                .add(HomeGridTypeChanged(gridType: value.roundToDouble()));
          },
        ),
      );
}

class _IconSizeSlider extends StatelessWidget {
  const _IconSizeSlider();

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _Slider(
          title: S.current.homeIconSizeHelper,
          value: state.iconSize,
          description: S.current.homeIconSizeDescription(state.iconSize),
          min: HomeState.iconSizeMin,
          max: HomeState.iconSizeMax,
          onChange: (value) {
            final exponent =
                (log(value) / log(HomeState.iconSizeBase)).roundToDouble();
            final size = pow(HomeState.iconSizeBase, exponent).toDouble();

            context.read<HomeBloc>().add(HomeIconSizeChanged(iconSize: size));
          },
        ),
      );
}
