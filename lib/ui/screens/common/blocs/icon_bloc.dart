import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:identicon_generator/domain/usecase_provider.dart';
import 'package:identicon_generator/ui/res/color.dart';

part 'package:identicon_generator/ui/screens/common/blocs/icon_event.dart';

part 'package:identicon_generator/ui/screens/common/blocs/icon_state.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  IconBloc() : super(const IconState()) {
    on<IconSettingsInitialized>(_onSettingsInitialized);
    on<IconPromptsChanged>(_onPromptsChanged);
    on<IconHashFunctionChanged>(_onHashFunctionChanged);
    on<IconGridTypeChanged>(_onGridTypeChanged);
    on<IconSizeChanged>(_onSizeChanged);
    on<IconColorChanged>(_onColorChanged);
    on<IconMarginRatioChanged>(_onMarginRatioChanged);
  }

  Future<void> _onSettingsInitialized(
    IconSettingsInitialized event,
    Emitter<IconState> emit,
  ) async {
    emit(UseCaseProvider.provideGetIconSettingsUseCase().execute());
  }

  Future<void> _onPromptsChanged(
    IconPromptsChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(prompts: event.prompts));
  }

  Future<void> _onHashFunctionChanged(
    IconHashFunctionChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(hashFunction: event.hashFunction));
    UseCaseProvider.provideSaveIconSettingsUseCase().execute(state);
  }

  Future<void> _onGridTypeChanged(
    IconGridTypeChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(gridType: event.gridType));
    UseCaseProvider.provideSaveIconSettingsUseCase().execute(state);
  }

  Future<void> _onSizeChanged(
    IconSizeChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(size: event.size));
    UseCaseProvider.provideSaveIconSettingsUseCase().execute(state);
  }

  Future<void> _onColorChanged(
    IconColorChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(
      useRandomColors: event.useRandomColors,
      colors: event.colors,
    ));
    UseCaseProvider.provideSaveIconSettingsUseCase().execute(state);
  }

  Future<void> _onMarginRatioChanged(
    IconMarginRatioChanged event,
    Emitter<IconState> emit,
  ) async {
    emit(state.copyWith(marginRatio: event.marginRatio));
    UseCaseProvider.provideSaveIconSettingsUseCase().execute(state);
  }
}
