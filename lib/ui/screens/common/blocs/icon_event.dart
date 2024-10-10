part of 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

sealed class IconEvent {}

final class IconPromptsChanged extends IconEvent {
  IconPromptsChanged({required this.prompts});

  final String prompts;
}

final class IconHashFunctionChanged extends IconEvent {
  IconHashFunctionChanged({required this.hashFunction});

  final SupportedHashFunction hashFunction;
}

final class IconGridTypeChanged extends IconEvent {
  IconGridTypeChanged({required this.gridType});

  final double gridType;
}

final class IconSizeChanged extends IconEvent {
  IconSizeChanged({required this.size});

  final double size;
}

final class IconColorChanged extends IconEvent {
  IconColorChanged({required this.useRandomColors, required this.colors});

  final bool useRandomColors;
  final IconColor colors;
}
