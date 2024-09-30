part of 'package:identicon_generator/ui/screens/common/blocs/icon_bloc.dart';

final class IconState extends Equatable {
  const IconState({
    this.prompts = '',
    this.hashFunction = SupportedHashFunction.md5,
    this.gridType = defaultGridType,
    this.size = defaultSize,
  });

  static const gridTypeMin = 3.0;
  static const defaultGridType = 5.0;
  static const gridTypeMax = 12.0;
  static const sizeBase = 2.0;
  static const sizeMin = 32.0;
  static const defaultSize = 128.0;
  static const sizeMax = 512.0;

  final String prompts;
  final SupportedHashFunction hashFunction;
  final double gridType;
  final double size;

  @override
  List<Object?> get props => [
        prompts,
        hashFunction,
        gridType,
        size,
      ];

  IconState copyWith({
    String? prompts,
    SupportedHashFunction? hashFunction,
    double? gridType,
    double? size,
  }) =>
      IconState(
        prompts: prompts ?? this.prompts,
        hashFunction: hashFunction ?? this.hashFunction,
        gridType: gridType ?? this.gridType,
        size: size ?? this.size,
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
