part of 'package:identicon_generator/ui/screens/splash/bloc/splash_bloc.dart';

final class SplashState extends Equatable {
  const SplashState({this.status = SplashStatus.initial});

  final SplashStatus status;

  @override
  List<Object?> get props => [status];

  SplashState copyWith({
    SplashStatus? status,
  }) =>
      SplashState(status: status ?? this.status);

  static const splashDuration = Duration(seconds: 2, milliseconds: 60);
}

enum SplashStatus {
  initial,
  loading,
  success,
  failure;

  bool get isEnded =>
      this == SplashStatus.success || this == SplashStatus.failure;
}
