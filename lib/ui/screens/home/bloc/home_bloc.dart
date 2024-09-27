import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'package:identicon_generator/ui/screens/home/bloc/home_event.dart';

part 'package:identicon_generator/ui/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomePromptsChanged>(_onPromptsChanged);
    on<HomeHashFunctionChanged>(_onHashFunctionChanged);
    on<HomeGridTypeChanged>(_onGridTypeChanged);
  }

  Future<void> _onPromptsChanged(
    HomePromptsChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(prompts: event.prompts));
    // TODO: Implement it.
    // Example:
    // import 'dart:convert';
    // import 'package:crypto/crypto.dart';
    // final bytes = utf8.encode(event.prompts);
    // md5.convert(bytes);
  }

  Future<void> _onHashFunctionChanged(
    HomeHashFunctionChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(hashFunction: event.hashFunction));
  }

  Future<void> _onGridTypeChanged(
    HomeGridTypeChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(gridType: event.gridType));
  }
}
