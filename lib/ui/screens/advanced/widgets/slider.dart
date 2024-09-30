part of 'package:identicon_generator/ui/screens/advanced/advanced_screen.dart';

class _Slider extends StatefulWidget {
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
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  bool isChanging = false;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStylez.regular12.copyWith(color: Colorz.darkGray),
          ),
          const SizedBox(height: 8.0),
          Slider(
            value: widget.value,
            onChanged: widget.onChange,
            onChangeStart: (_) {
              setState(() {
                isChanging = true;
              });
            },
            onChangeEnd: (_) {
              setState(() {
                isChanging = false;
              });
            },
            min: widget.min,
            max: widget.max,
            activeColor: Colorz.white,
            inactiveColor: Colorz.darkGray,
            overlayColor: const WidgetStatePropertyAll(Colorz.transparent),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.description, style: TextStylez.regular16),
            ],
          ),
          const SizedBox(height: 8.0),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: isChanging ? Colorz.white : Colorz.darkGray,
          ),
        ],
      );
}

class _GridTypeSlider extends StatelessWidget {
  const _GridTypeSlider();

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => _Slider(
          title: S.current.advancedGridTypeHelper,
          value: state.gridType,
          description: S.current.advancedGridTypeDescription(state.gridType),
          min: IconState.gridTypeMin,
          max: IconState.gridTypeMax,
          onChange: (value) {
            context
                .read<IconBloc>()
                .add(IconGridTypeChanged(gridType: value.roundToDouble()));
          },
        ),
      );
}

class _IconSizeSlider extends StatelessWidget {
  const _IconSizeSlider();

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => _Slider(
          title: S.current.advancedSizeHelper,
          value: state.size,
          description: S.current.advancedSizeDescription(state.size),
          min: IconState.sizeMin,
          max: IconState.sizeMax,
          onChange: (value) {
            final exponent =
                (log(value) / log(IconState.sizeBase)).roundToDouble();
            final size = pow(IconState.sizeBase, exponent).toDouble();

            context.read<IconBloc>().add(IconSizeChanged(size: size));
          },
        ),
      );
}
