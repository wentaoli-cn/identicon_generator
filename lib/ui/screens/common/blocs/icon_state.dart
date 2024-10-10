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

  static const gridTypeMin = 3.0;
  static const defaultGridType = 5.0;
  static const gridTypeMax = 12.0;
  static const sizeBase = 2.0;
  static const sizeMin = 32.0;
  static const defaultSize = 128.0;
  static const sizeMax = 512.0;
  static const defaultPixelColor = Colorz.cornflowerBlue;
  static const defaultBackgroundColor = Colorz.white;

  final String prompts;
  final SupportedHashFunction hashFunction;
  final double gridType;
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
    double? gridType,
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
  sha1(name: 'SHA-1'),
  sha224(name: 'SHA-224'),
  sha256(name: 'SHA-256'),
  sha384(name: 'SHA-384'),
  sha512(name: 'SHA-512'),
  adler32(name: 'Adler-32'),
  crc32(name: 'CRC-32');

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
