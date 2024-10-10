part of 'package:identicon_generator/ui/screens/advanced/advanced_screen.dart';

class _SingleColorPicker extends StatefulWidget {
  const _SingleColorPicker({
    required this.value,
    required this.label,
    this.onChange,
  });

  final Color value;
  final String label;
  final ValueChanged<Color>? onChange;

  int get red => value.red;

  int get green => value.green;

  int get blue => value.blue;

  @override
  State<_SingleColorPicker> createState() => _SingleColorPickerState();
}

class _SingleColorPickerState extends State<_SingleColorPicker> {
  bool _isExpanded = false;
  OverlayEntry _overlayEntry =
      OverlayEntry(builder: (_) => const SizedBox.shrink());

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (_isExpanded) {
            _dismissPicker();
          } else {
            _showPicker(color: widget.value, onChange: widget.onChange);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: widget.value,
                width: 16.0,
                height: 16.0,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.label,
              style: TextStylez.regular16,
            ),
          ],
        ),
      );

  @override
  void dispose() {
    _overlayEntry.remove();
    _overlayEntry.dispose();
    super.dispose();
  }

  void _showPicker({required Color color, ValueChanged<Color>? onChange}) {
    final anchor = context.findRenderObject() as RenderBox;
    final anchorSize = anchor.size;
    final location = anchor.localToGlobal(Offset.zero);
    final deviceSize = MediaQuery.of(context).size;

    setState(() {
      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                _dismissPicker();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colorz.black.withOpacity(0.1),
                  width: deviceSize.width,
                  height: deviceSize.height,
                ),
              ),
            ),
            Positioned(
              left: 12.0,
              top: location.dy + anchorSize.height + 4.0,
              right: 12.0,
              child: Material(
                color: Colorz.transparent,
                child: IntrinsicHeight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colorz.darkGray,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: widget.value,
                              border: Border.all(
                                color: ColorUtils.areColorsSimilar(
                                  color1: widget.value,
                                  color2: Colorz.white,
                                )
                                    ? Colorz.black
                                    : Colorz.white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(height: 4.0),
                          _colorSlider(
                            value: widget.red,
                            label: S.current.advancedColorRedLabel,
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                value,
                                widget.green,
                                widget.blue,
                              ));
                              _overlayEntry.markNeedsBuild();
                            },
                          ),
                          _colorSlider(
                            value: widget.green,
                            label: S.current.advancedColorGreenLabel,
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                widget.red,
                                value,
                                widget.blue,
                              ));
                              _overlayEntry.markNeedsBuild();
                            },
                          ),
                          _colorSlider(
                            value: widget.blue,
                            label: S.current.advancedColorBlueLabel,
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                widget.red,
                                widget.green,
                                value,
                              ));
                              _overlayEntry.markNeedsBuild();
                            },
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.warning_amber_rounded,
                                size: 16.0,
                                color: Colorz.indianRed,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  S.current.advancedColorWarning,
                                  style: TextStylez.regular14
                                      .copyWith(color: Colorz.indianRed),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
    Overlay.of(context).insert(_overlayEntry);
    setState(() {
      _isExpanded = true;
    });
    _ColorPicker._isExpanded = true;
  }

  void _dismissPicker() {
    _overlayEntry.remove();
    setState(() {
      _isExpanded = false;
    });
    _ColorPicker._isExpanded = false;
  }

  Widget _colorSlider({
    required int value,
    required String label,
    ValueChanged<int>? onChange,
  }) =>
      Row(
        children: [
          SizedBox(
            width: 64.0,
            child: Text(label, style: TextStylez.regular16),
          ),
          Expanded(
            child: Slider(
              value: value.toDouble(),
              onChanged: (value) {
                onChange?.call(value.round());
              },
              min: 0.0,
              max: 255.0,
              divisions: 256,
              label: value.toString(),
              activeColor: Colorz.khaki,
              inactiveColor: Colorz.lightYellow,
              overlayColor: const WidgetStatePropertyAll(Colorz.transparent),
            ),
          ),
        ],
      );
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker();

  static bool _isExpanded = false;

  static get isExpanded => _isExpanded;

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.advancedColorHelper,
              style: TextStylez.regular12.copyWith(color: Colorz.darkGray),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                context.read<IconBloc>().add(IconColorChanged(
                      useRandomColors: !state.useRandomColors,
                      colors: state.colors,
                    ));
              },
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    state.useRandomColors
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    size: 24.0,
                    color: Colorz.white,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    S.current.advancedRandomColorsLabel,
                    style: TextStylez.regular16,
                  ),
                ],
              ),
            ),
            if (!state.useRandomColors) ...[
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SingleColorPicker(
                    value: state.colors.pixelColor,
                    label: S.current.advancedPixelColorLabel,
                    onChange: (color) {
                      context.read<IconBloc>().add(IconColorChanged(
                            useRandomColors: state.useRandomColors,
                            colors: state.colors.copyWith(pixelColor: color),
                          ));
                    },
                  ),
                  _SingleColorPicker(
                    value: state.colors.backgroundColor,
                    label: S.current.advancedBackgroundColorLabel,
                    onChange: (color) {
                      context.read<IconBloc>().add(IconColorChanged(
                            useRandomColors: state.useRandomColors,
                            colors:
                                state.colors.copyWith(backgroundColor: color),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      );
}
