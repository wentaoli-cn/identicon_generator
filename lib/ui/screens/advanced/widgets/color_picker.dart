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
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  String get _currentText => _textController.text;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          _showPicker(color: widget.value, onChange: widget.onChange);
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.value,
                border: Border.all(
                  color: ColorUtils.areColorsSimilar(
                    color1: widget.value,
                    color2: Colorz.black,
                  )
                      ? Colorz.darkGray
                      : ColorUtils.areColorsSimilar(
                          color1: widget.value,
                          color2: Colorz.white,
                        )
                          ? Colorz.darkGray
                          : Colorz.white,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              width: 16.0,
              height: 16.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.label,
              style: TextStylez.regular16,
            ),
          ],
        ),
      );

  void _showPicker({required Color color, ValueChanged<Color>? onChange}) {
    final anchor = context.findRenderObject() as RenderBox;
    final anchorSize = anchor.size;
    final location = anchor.localToGlobal(Offset.zero);
    final deviceSize = MediaQuery.of(context).size;

    OverlayUtils.tryToShowOverlay(
      context,
      OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (_focusNode.hasFocus) {
                  _editComplete();
                  return;
                }
                OverlayUtils.removeAll();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      color: Colorz.darkGray,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: widget.value,
                                  border: Border.all(
                                    color: ColorUtils.areColorsSimilar(
                                      color1: widget.value,
                                      color2: Colorz.darkGray,
                                    )
                                        ? Colorz.black
                                        : ColorUtils.areColorsSimilar(
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
                              const SizedBox(width: 8.0),
                              IntrinsicWidth(
                                child: TextField(
                                  controller: _textController,
                                  focusNode: _focusNode,
                                  decoration: InputDecoration(
                                    hintText:
                                        ColorUtils.colorToRgbHex(widget.value),
                                    hintStyle: TextStylez.regular16
                                        .copyWith(color: Colorz.khaki),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(4.0),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        S.current.advancedColorHashLabel,
                                        style: TextStylez.regular16.copyWith(
                                            color: Colorz.lightYellow),
                                      ),
                                    ),
                                    prefixIconConstraints:
                                        const BoxConstraints(),
                                    counterText: '',
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colorz.lightYellow),
                                      gapPadding: 0.0,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colorz.khaki),
                                      gapPadding: 0.0,
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  style: TextStylez.regular16
                                      .copyWith(color: Colorz.lightYellow),
                                  maxLength: 6,
                                  onEditingComplete: _editComplete,
                                ),
                              ),
                            ],
                          ),
                          _colorSlider(
                            value: widget.red,
                            label: S.current.advancedColorRedLabel(widget.red),
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                value,
                                widget.green,
                                widget.blue,
                              ));
                              OverlayUtils.rebuildAll();
                            },
                          ),
                          _colorSlider(
                            value: widget.green,
                            label:
                                S.current.advancedColorGreenLabel(widget.green),
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                widget.red,
                                value,
                                widget.blue,
                              ));
                              OverlayUtils.rebuildAll();
                            },
                          ),
                          _colorSlider(
                            value: widget.blue,
                            label:
                                S.current.advancedColorBlueLabel(widget.blue),
                            onChange: (value) {
                              widget.onChange?.call(Color.fromARGB(
                                255,
                                widget.red,
                                widget.green,
                                value,
                              ));
                              OverlayUtils.rebuildAll();
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
      ),
    );
  }

  void _editComplete() {
    if (ColorUtils.isRgbHex(_currentText)) {
      widget.onChange?.call(Color(int.parse(
        'FF$_currentText',
        radix: 16,
      )));
      OverlayUtils.rebuildAll();
    }
    _textController.clear();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget _colorSlider({
    required int value,
    required String label,
    ValueChanged<int>? onChange,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStylez.regular16.copyWith(color: Colorz.lightYellow),
          ),
          Slider(
            value: value.toDouble(),
            onChanged: (value) {
              onChange?.call(value.round());
            },
            min: 0.0,
            max: 255.0,
            divisions: 255,
            activeColor: Colorz.khaki,
            inactiveColor: Colorz.lightYellow,
            overlayColor: const WidgetStatePropertyAll(Colorz.transparent),
          ),
        ],
      );
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker();

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
              const SizedBox(height: 4.0),
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
