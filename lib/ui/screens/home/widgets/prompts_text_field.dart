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
  Widget build(BuildContext context) => BlocBuilder<IconBloc, IconState>(
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
                  context.read<IconBloc>().add(IconPromptsChanged(prompts: ''));
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
            context.read<IconBloc>().add(IconPromptsChanged(prompts: value));
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
