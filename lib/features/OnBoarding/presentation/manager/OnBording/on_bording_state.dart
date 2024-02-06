part of 'on_bording_cubit.dart';

@immutable
sealed class OnBordingState {}

final class OnBordingInitial extends OnBordingState {}

final class OnBordingLoading extends OnBordingState {}

final class UnAuthentication extends OnBordingState {}

final class OnBordingFailed extends OnBordingState {}

final class OnBordingSucess extends OnBordingState {
  final User user;

  OnBordingSucess(this.user);
}
