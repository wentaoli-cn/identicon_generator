part of 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

final class IconState extends Equatable {
  const IconState({
    this.prompts = '',
    this.hashFunction = SupportedHashFunction.md5,
    this.gridType = defaultGridType,
    this.size = defaultSize,
    this.useRandomColors = true,
    this.colors = const IconColor(
      pixelColor: defaultPixelColor,
      backgroundColor: defaultBackgroundColor,
    ),
  });

  static const minGridType = 4;
  static const defaultGridType = 8;
  static const maxGridType = 16;
  static const sizeBase = 2.0;
  static const minSize = 32.0;
  static const defaultSize = 512.0;
  static const maxSize = 1024.0;
  static const defaultPixelColor = Colorz.cornflowerBlue;
  static const defaultBackgroundColor = Colorz.white;

  final String prompts;
  final SupportedHashFunction hashFunction;
  final int gridType;
  final double size;
  final bool useRandomColors;
  final IconColor colors;

  @override
  List<Object?> get props => [
        prompts,
        hashFunction,
        gridType,
        size,
        useRandomColors,
        colors,
      ];

  IconState copyWith({
    String? prompts,
    SupportedHashFunction? hashFunction,
    int? gridType,
    double? size,
    bool? useRandomColors,
    IconColor? colors,
  }) =>
      IconState(
        prompts: prompts ?? this.prompts,
        hashFunction: hashFunction ?? this.hashFunction,
        gridType: gridType ?? this.gridType,
        size: size ?? this.size,
        useRandomColors: useRandomColors ?? this.useRandomColors,
        colors: colors ?? this.colors,
      );
}

enum SupportedHashFunction {
  md5(name: 'MD5'),
  sha1(name: 'SHA1'),
  sha224(name: 'SHA224'),
  sha256(name: 'SHA256'),
  sha384(name: 'SHA384'),
  sha512(name: 'SHA512'),
  hmacMd5(name: 'HMAC-MD5'),
  hmacSha256(name: 'HMAC-SHA256');

  const SupportedHashFunction({required this.name});

  final String name;
}

class IconColor extends Equatable {
  const IconColor({required this.pixelColor, required this.backgroundColor});

  final Color pixelColor;
  final Color backgroundColor;

  @override
  List<Object?> get props => [pixelColor, backgroundColor];

  IconColor copyWith({
    Color? pixelColor,
    Color? backgroundColor,
  }) =>
      IconColor(
        pixelColor: pixelColor ?? this.pixelColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );
}
