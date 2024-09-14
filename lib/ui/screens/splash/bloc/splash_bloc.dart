import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'package:identicon_generator/ui/screens/splash/bloc/splash_event.dart';

part 'package:identicon_generator/ui/screens/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashStarted>(_onStarted);

    add(SplashStarted());
  }

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(status: SplashStatus.loading));

    await Future.delayed(SplashState.splashDuration).then(
      (_) {
        emit(state.copyWith(status: SplashStatus.success));
      },
    ).catchError(
      (_) {
        emit(state.copyWith(status: SplashStatus.failure));
      },
    );
  }
}
