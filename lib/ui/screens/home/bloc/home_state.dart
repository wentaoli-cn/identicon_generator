part of 'package:identicon_generator/ui/screens/home/bloc/home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.prompts = '',
    this.hashFunction = SupportedHashFunction.md5,
    this.gridType = defaultGridType,
    this.iconSize = defaultIconSize,
  });

  static const gridTypeMin = 3.0;
  static const defaultGridType = 5.0;
  static const gridTypeMax = 12.0;
  static const iconSizeBase = 2.0;
  static const iconSizeMin = 32.0;
  static const defaultIconSize = 128.0;
  static const iconSizeMax = 512.0;

  final String prompts;
  final SupportedHashFunction hashFunction;
  final double gridType;
  final double iconSize;

  @override
  List<Object?> get props => [
        prompts,
        hashFunction,
        gridType,
        iconSize,
      ];

  HomeState copyWith({
    String? prompts,
    SupportedHashFunction? hashFunction,
    double? gridType,
    double? iconSize,
  }) =>
      HomeState(
        prompts: prompts ?? this.prompts,
        hashFunction: hashFunction ?? this.hashFunction,
        gridType: gridType ?? this.gridType,
        iconSize: iconSize ?? this.iconSize,
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
