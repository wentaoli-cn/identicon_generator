part of 'package:identicon_generator/ui/screens/home/bloc/home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.prompts = '',
    this.hashFunction = SupportedHashFunction.md5,
  });

  final String prompts;
  final SupportedHashFunction hashFunction;

  @override
  List<Object?> get props => [
        prompts,
        hashFunction,
      ];

  HomeState copyWith({
    String? prompts,
    SupportedHashFunction? hashFunction,
  }) =>
      HomeState(
        prompts: prompts ?? this.prompts,
        hashFunction: hashFunction ?? this.hashFunction,
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
