part of 'package:identicon_generator/ui/screens/advanced/advanced_screen.dart';

class _HashFunctionPicker extends StatefulWidget {
  const _HashFunctionPicker();

  @override
  State<_HashFunctionPicker> createState() => _HashFunctionPickerState();
}

class _HashFunctionPickerState extends State<_HashFunctionPicker> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.advancedHashFunctionHelper,
              style: TextStylez.regular12.copyWith(color: Colorz.darkGray),
            ),
            GestureDetector(
              onTap: () {
                _showMenu(selectedHashFunction: state.hashFunction);
              },
              behavior: HitTestBehavior.translucent,
              child: Row(
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
            ),
            const Divider(height: 1.0, thickness: 1.0, color: Colorz.darkGray),
          ],
        ),
      );

  void _showMenu({required SupportedHashFunction selectedHashFunction}) {
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
                _dismissMenu();
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
              left: location.dx,
              top: location.dy + anchorSize.height + 4.0,
              right: location.dx,
              child: Material(
                color: Colorz.transparent,
                child: IntrinsicHeight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
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
                                  context.read<IconBloc>().add(
                                      IconHashFunctionChanged(
                                          hashFunction: value));
                                  _dismissMenu();
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
      ),
    );
    setState(() {
      _isExpanded = true;
    });
  }

  void _dismissMenu() {
    OverlayUtils.removeAll();
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
