part of 'package:identicon_generator/ui/screens/home/bloc/home_bloc.dart';

sealed class HomeEvent {}

final class HomePromptsChanged extends HomeEvent {
  HomePromptsChanged({required this.prompts});

  final String prompts;
}

final class HomeHashFunctionChanged extends HomeEvent {
  HomeHashFunctionChanged({required this.hashFunction});

  final SupportedHashFunction hashFunction;
}
