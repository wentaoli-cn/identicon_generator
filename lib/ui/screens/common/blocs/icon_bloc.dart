import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:identicon_generator/ui/res/color.dart';

part 'package:identicon_generator/ui/screens/common/blocs/icon_event.dart';

part 'package:identicon_generator/ui/screens/common/blocs/icon_state.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  IconBloc() : super(const IconState()) {
    on<IconPromptsChanged>(_onPromptsChanged);
    on<IconHashFunctionChanged>(_onHashFunctionChanged);
    on<IconGridTypeChanged>(_onGridTypeChanged);
    on<IconSizeChanged>(_onSizeChanged);
    on<IconColorChanged>(_onColorChanged);
  }

  Future<void> _onPromptsChanged(
    IconPromptsChanged event,
    Emitter<IconState> emit,
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
    IconHashFunctionChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(hashFunction: event.hashFunction));
  }

  Future<void> _onGridTypeChanged(
    IconGridTypeChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(gridType: event.gridType));
  }

  Future<void> _onSizeChanged(
    IconSizeChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(size: event.size));
  }

  Future<void> _onColorChanged(
    IconColorChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(
      useRandomColors: event.useRandomColors,
      colors: event.colors,
    ));
  }
}
