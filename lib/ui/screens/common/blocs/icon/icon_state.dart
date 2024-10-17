part of 'package:identicon_generator/ui/screens/common/blocs/icon/icon_bloc.dart';

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
    this.marginRatio = defaultMarginRatio,
  });

  factory IconState.fromJson(Map<String, dynamic> json) => IconState(
        hashFunction:
            SupportedHashFunction.values.toList()[json[hashFunctionKey] as int],
        gridType: json[gridTypeKey] as int,
        size: json[sizeKey] as double,
        useRandomColors: json[useRandomColorsKey] as bool,
        colors: IconColor(
          pixelColor: Color(json[pixelColorKey] as int),
          backgroundColor: Color(json[backgroundColorKey] as int),
        ),
        marginRatio: json[marginRatioKey] as double,
      );

  static const minGridType = 4;
  static const defaultGridType = 8;
  static const maxGridType = 16;
  static const sizeBase = 2.0;
  static const minSize = 32.0;
  static const defaultSize = 512.0;
  static const maxSize = 1024.0;
  static const defaultPixelColor = Colorz.cornflowerBlue;
  static const defaultBackgroundColor = Colorz.white;
  static const minMarginRatio = 0.0;
  static const defaultMarginRatio = 20.0;
  static const maxMarginRatio = 60.0;
  static const hashFunctionKey = 'hash function';
  static const gridTypeKey = 'grid type';
  static const sizeKey = 'size';
  static const useRandomColorsKey = 'use random colors';
  static const pixelColorKey = 'pixel color';
  static const backgroundColorKey = 'background color';
  static const marginRatioKey = 'margin ratio';

  final String prompts;
  final SupportedHashFunction hashFunction;
  final int gridType;
  final double size;
  final bool useRandomColors;
  final IconColor colors;
  final double marginRatio;

  @override
  List<Object?> get props => [
        prompts,
        hashFunction,
        gridType,
        size,
        useRandomColors,
        colors,
        marginRatio,
      ];

  IconState copyWith({
    String? prompts,
    SupportedHashFunction? hashFunction,
    int? gridType,
    double? size,
    bool? useRandomColors,
    IconColor? colors,
    double? marginRatio,
  }) =>
      IconState(
        prompts: prompts ?? this.prompts,
        hashFunction: hashFunction ?? this.hashFunction,
        gridType: gridType ?? this.gridType,
        size: size ?? this.size,
        useRandomColors: useRandomColors ?? this.useRandomColors,
        colors: colors ?? this.colors,
        marginRatio: marginRatio ?? this.marginRatio,
      );

  Map<String, dynamic> toJson() => {
        hashFunctionKey: hashFunction.index,
        gridTypeKey: gridType,
        sizeKey: size,
        useRandomColorsKey: useRandomColors,
        pixelColorKey: colors.pixelColor.value,
        backgroundColorKey: colors.backgroundColor.value,
        marginRatioKey: marginRatio,
      };
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
