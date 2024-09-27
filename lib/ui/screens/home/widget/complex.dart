part of 'package:identicon_generator/ui/screens/home/home_screen.dart';

class _PromptsTextField extends StatefulWidget {
  const _PromptsTextField();

  @override
  State<_PromptsTextField> createState() => _PromptsTextFieldState();
}

class _PromptsTextFieldState extends State<_PromptsTextField> {
  final _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: S.current.homePromptsHint,
            hintStyle: TextStylez.regular16.copyWith(color: Colorz.darkGray),
            helper: Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 16.0,
                  color: Colorz.indianRed,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    S.current.homePromptsHelper,
                    style:
                        TextStylez.regular14.copyWith(color: Colorz.indianRed),
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero,
            suffixIcon: GestureDetector(
              onTap: () {
                if (_text.isNotEmpty) {
                  setState(() {
                    _textController.clear();
                  });
                  context.read<HomeBloc>().add(HomePromptsChanged(prompts: ''));
                }
              },
              child: const Icon(Icons.close_rounded, size: 24.0),
            ),
            suffixIconColor: _text.isNotEmpty ? Colorz.white : Colorz.darkGray,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colorz.white),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colorz.darkGray),
            ),
          ),
          textInputAction: TextInputAction.done,
          style: TextStylez.regular16,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {
            context.read<HomeBloc>().add(HomePromptsChanged(prompts: value));
          },
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
        ),
      );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class _HashFunctionPicker extends StatefulWidget {
  const _HashFunctionPicker();

  @override
  State<_HashFunctionPicker> createState() => _HashFunctionPickerState();
}

class _HashFunctionPickerState extends State<_HashFunctionPicker> {
  bool _isExpanded = false;
  OverlayEntry _overlayEntry =
      OverlayEntry(builder: (_) => const SizedBox.shrink());

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            if (_isExpanded) {
              _showMenu(selectedHashFunction: state.hashFunction);
            } else {
              _dismissMenu();
            }
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.homeHashFunctionHelper,
                style: TextStylez.regular12.copyWith(color: Colorz.darkGray),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      state.hashFunction.name,
                      style: TextStylez.regular16,
                    ),
                  ),
                  SizedBox.square(
                    dimension: 48.0,
                    child: Icon(
                      _isExpanded
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      size: 24.0,
                      color: Colorz.white,
                    ),
                  )
                ],
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: _isExpanded ? Colorz.white : Colorz.darkGray,
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _overlayEntry.dispose();
    super.dispose();
  }

  void _showMenu({required SupportedHashFunction selectedHashFunction}) {
    final anchor = context.findRenderObject() as RenderBox;
    final anchorSize = anchor.size;
    final location = anchor.localToGlobal(Offset.zero);
    final deviceSize = MediaQuery.of(context).size;

    setState(
      () {
        _overlayEntry = OverlayEntry(
          builder: (context) => Stack(
            children: [
              GestureDetector(
                onTap: () {
                  _dismissMenu();
                },
                child: Container(
                  color: Colorz.transparent,
                  width: deviceSize.width,
                  height: deviceSize.height,
                ),
              ),
              Positioned(
                left: location.dx,
                top: location.dy + anchorSize.height + 4.0,
                child: Material(
                  color: Colorz.transparent,
                  child: IntrinsicHeight(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      child: ColoredBox(
                        color: Colorz.darkGray,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: SupportedHashFunction.values
                              .map<Widget>(
                                (value) => _menuItem(
                                  value: value,
                                  isSelected: value == selectedHashFunction,
                                  onTap: () {
                                    _dismissMenu();
                                    context.read<HomeBloc>().add(
                                        HomeHashFunctionChanged(
                                            hashFunction: value));
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry);
  }

  void _dismissMenu() {
    _overlayEntry.remove();
    setState(() {
      _isExpanded = false;
    });
  }

  Widget _menuItem({
    required SupportedHashFunction value,
    required bool isSelected,
    VoidCallback? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: isSelected ? Colorz.lightYellow : null,
          width: MediaQuery.of(context).size.width - 12.0 * 2,
          child: Text(
            value.name,
            style: TextStylez.regular16.copyWith(color: Colorz.khaki),
          ),
        ),
      );
}
